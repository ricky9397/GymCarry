package com.project.gymcarry.about;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class AboutController {

		@RequestMapping("about")
		public String ContentModify() {
			
			return "about/about";
		}
		
		
		
		
		
}
