package springbootTest;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;


@RestController
@EnableAutoConfiguration
public class SpringBootTest {

	    @RequestMapping("/")
	    String home() {
	        return "Hello World!";
	    }

	    public static void main(String[] args) throws Exception {
	    	System.out.println("Spring boot app from Docker..............................&&&&&&&&");
	        SpringApplication.run(SpringBootTest.class, args);
	    }

	}
