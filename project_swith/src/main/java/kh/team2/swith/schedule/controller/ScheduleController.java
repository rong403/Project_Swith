package kh.team2.swith.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.team2.swith.schedule.model.service.ScheduleService;
import kh.team2.swith.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	 
    @GetMapping("/study/calendar")
    @ResponseBody
    public List<Map<String, Object>> monthPlan(@RequestParam(name="study_no") int study_no) {
        List<Schedule> listAll = scheduleService.selectSchedule(study_no);
 
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        
        HashMap<String, Object> hash = new HashMap<>();
        
        for (int i = 0; i < listAll.size(); i++) {
        	hash.put("title", listAll.get(i).getSchedule_content());
            hash.put("start", listAll.get(i).getStart_date());
            hash.put("end", listAll.get(i).getEnd_date());
 
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        }
        return jsonArr;
    }
    @RequestMapping(value = "/insertSchedule", method = RequestMethod.POST)
    public void insertSchedule(Schedule vo
    		, Principal principal
    		, HttpServletResponse response
    		) throws IOException {
    	String member_id = principal.getName();
    	vo.setMember_id(member_id);
    	int result = scheduleService.insertSchedule(vo);
    	PrintWriter out = response.getWriter();
		if(result == 1) {
			out.print("success");
		} else {
			out.print("fail");
		}
    }
}
