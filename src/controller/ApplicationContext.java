package controller;

import java.io.FileReader;
import java.lang.reflect.Method;
import java.util.Hashtable;
import java.util.Properties;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.reflections.Reflections;

public class ApplicationContext {
	Hashtable<String, Object> objTable = new Hashtable<String, Object>();
	
	public Object getBean(String key) {
		return objTable.get(key);
	}
	public ApplicationContext(String propertiesPath) throws Exception {
		System.out.println("ApplicationContext 진입");
		Properties props = new Properties();
		props.load(new FileReader(propertiesPath));
		
/*	
 		메이븐 프로젝트로 한다면...
		
		reflections-0.9.9-RC1.jar
		pom.xml
		<dependency>
			<groupId>org.reflections</groupId>
			<artifactId>reflections</artifactId>
			<version>0.9.9-RC1</version>
		</dependency>
*/
		prepareObjects(props);
		prepareAnnotationObjects();
		injectDependency();
	}

	private void prepareObjects(Properties props) throws Exception {
		Context ctx = new InitialContext();
		String key = null;
		String value = null;
		
		for (Object item : props.keySet()) {
			key = (String) item;
			value = props.getProperty(key);
			if (key.startsWith("jndi.")) {
				objTable.put(key, ctx.lookup(value));
				System.out.println("jndi키 : " + key);
				System.out.println("jndi 밸류 : " + value);
			} else {
				objTable.put(key, Class.forName(value).newInstance());
				System.out.println("컨트롤러 객체 키 : " + key);
				System.out.println("컨트롤러 객체 밸류 : " + value);
			}
		}
	}
	
	private void prepareAnnotationObjects() throws Exception {
		System.out.println("");
		System.out.println("prepareAnnotationObjects 시작");
		Reflections reflector = new Reflections("");
		Set<Class<?>> list = reflector.getTypesAnnotatedWith(Component.class);
		String key = null;

		for (Class<?> clazz : list) {
			key = clazz.getAnnotation(Component.class).value();
			objTable.put(key, clazz.newInstance());
			System.out.println("objTable 키 : " + key);
			System.out.println("objTable 밸류 : " + clazz.newInstance());
		}
	}

	private void injectDependency() throws Exception {
		for (String key : objTable.keySet()) {
			if (!key.startsWith("jndi.")) {
				callSetter(objTable.get(key));
			}
		}
	}
	private void callSetter(Object obj) throws Exception {
		Object dependency = null;
		
		for (Method m : obj.getClass().getMethods()) { // obj로 받아온 클래스의 메소드를 하나씩 불러온다
			if (m.getName().startsWith("set")) { // 불러온 메소드가 set으로 시작한다면 if문 진입
				dependency = findObjectByType(m.getParameterTypes()[0]);
				System.out.println();
				System.out.println("메소드 이름 : " + m.getName());
				System.out.println("m.getParameterTypes()[0] : " + m.getParameterTypes()[0]);
				if (dependency != null) {
					System.out.println("m.invoke(" + obj + ", " + dependency + ");");
					m.invoke(obj, dependency);
				}
			}
		}
	}
	private Object findObjectByType(Class<?> type) {
		for (Object obj : objTable.values()) {
			if (type.isInstance(obj)) {
				return obj;
			}
		}
		return null;
	}
}
