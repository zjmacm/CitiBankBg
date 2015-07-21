package com.citibank.controller;

import com.citibank.common.IdUtil;
import com.citibank.service.InvestorService;
import com.sun.prism.shader.Mask_TextureSuper_AlphaTest_Loader;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

/**
 * Created by liuhao on 15-7-14.
 */
@Controller("InvestorController")
@RequestMapping("/investor")
public class InvestorController {

    @Autowired
    private InvestorService investorService;

    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String getLoginPage() {
        return "investor/investorLogin";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(@RequestParam Map<String, Object> reqs,
                          HttpSession session) {
        Map<String, Object> result = investorService.loginInvestor(reqs);
        if (result.get("result").equals("success")) {
            session.setAttribute("userId", result.get("id"));
            return "investor/index";
        } else {
            return "investor/login";
        }
    }

    @RequestMapping(value = "/register.htm", method = RequestMethod.GET)
    public String getRegisterPage() {
        return "investor/investorRegister";
    }


    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    public String doRegister(@RequestParam Map<String, Object> regs) {
        regs.put("id", IdUtil.uuid());
        String result = investorService.registerInvestor(regs);
        if (result.equals("failed")) {
            return "investor/investorRegister";
        } else {
            return "investor/completeInfo";
        }
    }

    @RequestMapping(value = "/doCompleteInfo", method = RequestMethod.POST)
    public String completeInfo(@RequestParam Map<String, Objects> infos, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        String result = investorService.completeInfo(infos, userId);
        if (result.equals("failed")) {
            return "investor/completeInfo";
        } else {
            return "investor/index";
        }
    }

    @RequestMapping(value = "/completeInfo.htm", method = RequestMethod.GET)
    public String getCompleteInfoPage() {
        return "investor/completeInfo";
    }

    @RequestMapping(value = "/hasEmail", method = RequestMethod.GET)
    public
    @ResponseBody
    boolean hasEmail(@RequestParam("email") String email) {
        return investorService.hasEmail(email);
    }

    @RequestMapping(value = "/getUserInfo.htm", method = RequestMethod.GET)
    public String getUserInfo(HttpSession session, Map<String, Object> map) {
        String userId = (String) session.getAttribute("userId");
        map.putAll(investorService.getInvestorInfo(userId));
        return "common/userInfo";
    }

    @RequestMapping(value = "/saveUserInfo", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, String> saveUserInfo(@RequestParam Map<String, Object> parms, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        int result = investorService.saveInvestorInfo(parms, userId);
        Map<String, String> status = new HashMap<String, String>();
        if (result == 0) {
            status.put("result", "failed");
        } else {
            status.put("result", "success");
        }
        return status;
    }

}
