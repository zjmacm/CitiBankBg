package com.citibank.controller;

import com.citibank.dao.Page;
import com.citibank.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * Created by Nikolas on 2015/7/21.
 */
@Controller
@RequestMapping("/report")
public class ReportController {
    
    @Autowired
    private ReportService reportService;
    
    @RequestMapping(value = "/center.htm", method = RequestMethod.GET)
    public String getCenterReport(Map<String, Object> map){
        List<Map<String, Object>> result = reportService.getCenterReport();
        map.put("data",result);
        return "";
    }

    @RequestMapping(value = "/credit.htm", method = RequestMethod.GET)
    public String getCreditReport(@RequestParam("pageIndex")int pageIndex, Map<String, Object> map){
        Page<Map<String, Object>> result=reportService.getCreditReport(pageIndex);
        map.put("pageIndex",pageIndex);
        map.put("totalPage",result.getpageCount());
        map.put("data", result.getList());
        return "";
    }

    @RequestMapping(value = "/policy.htm", method = RequestMethod.GET)
    public String getPolicyReport(Map<String,Object> map){
        List<Map<String, Object>> result = reportService.getPolicyReport();
        map.put("data", result);
        return "";
    }

    @RequestMapping(value = "/market.htm", method = RequestMethod.GET)
    public String getMarketReport(Map<String, Object> map){
        List<Map<String, Object>> result = reportService.getMarketReport();
        map.put("data", result);
        return "";
    }

    @RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
    public String getReportDetail(@RequestParam("reportId") String reportId, Map<String,Object> map){
        String fileUrl = reportService.getReportFile(reportId);
        map.put("url", fileUrl);
        return "";
    }
}
