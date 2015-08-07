package com.citibank.controller;

import com.citibank.service.impl.IntentionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liuhao on 15-7-21.
 */
@Controller
@RequestMapping("/intention")
public class IntentionController {

    @Autowired
    private IntentionServiceImpl intentionService;

    //意向发布的页面默认返回股权的页面
    @RequestMapping(value = "/getIntentionPage")
    public String getIntentionPage() {
        return "investor/release_tender_offers";
    }

    //意向发布的债权页面
    @RequestMapping(value = "/getDebtPage")
    public String getDebtPage() {
        return "investor/release_debt_purchase";
    }

    @RequestMapping("/intention.htm")
    public Map<String, Object> investorInfo(HttpSession session) {
        String investorid = (String) session.getAttribute("investorId");
        Map<String, Object> result = intentionService.getInvestorinfoById(investorid);
        return result;

    }

    //意向发布的按钮
    @RequestMapping("/intentionPublish")
    public Model intentionPublish(@RequestParam Map<String, Object> reqs, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (intentionService.publishIntention(reqs)) {
            map.put("result", "suceess");
        } else {
            map.put("result", "fail");
        }
        model.addAttribute(map);
        return model;
    }

}
