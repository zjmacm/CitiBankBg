package com.citibank.service.impl;

import com.citibank.common.IdUtil;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.InvestorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by liuhao on 15-7-14.
 */
@Service
public class InvestorServiceImp implements InvestorService {
    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public MySQLSimpleDaoImpl getMySQLSimpleDao() {
        return mySQLSimpleDao;
    }

    public void setMySQLSimpleDao(MySQLSimpleDaoImpl mySQLSimpleDao) {
        this.mySQLSimpleDao = mySQLSimpleDao;
    }

    public Map<String, Object> registerInvestor(Map<String, Object> reqs) {
        String result = "";
        String username = (String) reqs.get("username");
        String sql = String.format("select * from investor where username=%",username);
        if (mySQLSimpleDao.queryForList(sql, new HashMap<String, Object>()).size() > 0) {
            result = "repeat";
        } else {
            try {
                String investorId= IdUtil.uuid();
                reqs.put("investorId",investorId);
                mySQLSimpleDao.create("investor", reqs);
                result = "success";
            } catch (Exception e) {
                e.printStackTrace();
                result = "failed";
            }
        }
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("result",result);
        return map;
    }

    public Map<String, Object> loginInvestor(Map<String, Object> reqs) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (!reqs.containsKey("username") || !reqs.containsKey("password")) {
            result.put("result", "failed");
        } else {
            String sql = "select * from investor where investorName = :investorName and" +
                    " password = :password";
            List<Map<String, Object>> list = mySQLSimpleDao.queryForList(sql, reqs);
            if (list.size() == 1) {
                result.put("result", "success");
                result.put("id", list.get(0).get("id"));
            } else {
                result.put("result", "failed");
            }
        }
        return result;
    }

    public String completeInfo(Map<String, Objects> infos, String userId) {
        Map<String, Object> cons = new HashMap<String, Object>();
        cons.put("id", userId);
        try {
            mySQLSimpleDao.update("investor", infos, cons);
        } catch (Exception ex) {
            return "failed";
        }
        return "success";
    }

    public boolean hasEmail(String email) {
        List<Map<String, Object>> result = mySQLSimpleDao.queryForList("select * from investor where username = :username", email);
        if(result.size()>0){
            return false;
        }
        return true;
    }

    public Map<String, Object> getInvestorInfo(String userId) {
        List<Map<String, Object>> result = mySQLSimpleDao.queryForList("select * from investor");
        if(result.size()==0){
            Map<String ,Object> map=new HashMap<String, Object>();
            map.put("error","true");
            return map;
        }
        return result.get(0);
    }

    public int saveInvestorInfo(Map<String, Object> map, String userId) {
        Map<String,Object> cons=new HashMap<String, Object>();
        cons.put("investorId", userId);
        return mySQLSimpleDao.update("investor", map, cons);
    }

}
