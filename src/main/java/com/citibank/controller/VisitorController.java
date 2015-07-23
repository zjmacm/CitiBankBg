package com.citibank.controller;

import com.citibank.dao.Page;
import com.citibank.entity.Investor;
import com.citibank.service.InvestorService;
import com.citibank.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zjm on 2015/7/22.
 */

@Controller("InformationController")
public class VisitorController {

    @Autowired
    private VisitorService visitorService;

    //游客模式下查看政策咨询和市场咨询
    @RequestMapping(value="/policy.htm",method = RequestMethod.GET)
    public String getPolicyPage(){
        return "visitor/policy";
    }

    @RequestMapping(value="/getPolicyList",method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> getPolicyList(@RequestParam(value="pageIndex",required = false,defaultValue = "1")int pageIndex,
            Map<String,Object> map){
        Page<Map<String,Object>> list = visitorService.getPolicyList(pageIndex);
        map.put("pageIndex",list.getIndex());
        map.put("pageSize",list.getpageCount());
        map.put("data",list.getList());
        return map;
    }



    @RequestMapping(value="/getPolicyDetail",method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> getPolicyDetail(HttpSession session){
        String id = session.getAttribute("id").toString();
        Map<String,Object> map = new HashMap<String, Object>();
        map =  visitorService.getPolicyInfoDetail(id);
        return map;
    }

    //市场咨询
    @RequestMapping(value="/market.htm",method = RequestMethod.POST)
    public String getMarketPage(){
        return "visitor/market";
    }

    @RequestMapping(value="/getMarketList",method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> getMarketList(@RequestParam(value = "pageIndex",required=false,defaultValue = "1")int pageIndex,
                                Map<String,Object> map){
        Page<Map<String,Object>> list = visitorService.getMarketList(pageIndex);
        map.put("pageIndex",list.getIndex());
        map.put("pageSize",list.getpageCount());
        map.put("data",list.getList());
        return map;
    }


    @RequestMapping(value = "/getMarketDetail",method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> getMarketDetail(HttpSession session){
        String id  = session.getAttribute("id").toString();
        Map<String,Object> map = new HashMap<String,Object>();
        map = visitorService.getMarketInfoDetail(id);
        return map;
    }

    @RequestMapping(value = "/getFinancingCompany",method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> getFinancingCom(
            @RequestParam(value = "pageIndex",required = false,defaultValue = "1")int pageIndex,
            Map<String,Object> map) {
        Page<Map<String,Object>> page = visitorService.getFinancingCom(pageIndex);
        map.put("pageIndex",page.getIndex());
        map.put("pageSize",page.getpageCount());
        map.put("data",page.getList());
        return map;
    }



}