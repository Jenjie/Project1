package action;

import model.Parameter.Personal;
import model.Parameter.PlaceID;
import model.Parameter.ReqParam;
import model.Parameter.parameter;
import model.Place.Results;
import util.*;

public class ReqAction {
    public ReqParam req = new ReqParam();
    public Personal person = new Personal();
    public Map map = new Map();
    public LoginDatabase loginDatabase = new LoginDatabase();
    public Results results = new Results();
    public parameter param = new parameter();
    public UpdateSelect select = new UpdateSelect();
    public PlaceID id = new PlaceID();
    public SaveHistory save = new SaveHistory();
    public ClearDB clear =  new ClearDB();

    public Results getResults() {
        return results;
    }
    public void setResults(Results results) {
        this.results = results;
    }

    public Personal getPerson() {
        return person;
    }
    public void setPerson(Personal person) {
        this.person = person;
    }

    public ReqParam getReq() {
        return req;
    }
    public void setReq(ReqParam req) {
        this.req = req;
    }

    public parameter getParam() {
        return param;
    }
    public void setParam(parameter param) {
        this.param = param;
    }
    public String p_id ;
    public String getP_id() {
        return p_id;
    }
    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public String reqparam(){
        map.map(req,person);
        return "SUCCESS"  ;
    }
    public String login(){
        loginDatabase.CheckLogin(person);
        clear.clearDB(person);
        return "SUCCESS" ;
    }
    public String time(){
        select.UpdateSelect(param);
        return "SUCCESS" ;
    }
    public String showmap(){
        save.Savehistory(id);
        return "SUCCESS";
    }
    public String showdata(){
        return "SUCCESS" ;
    }
    public String update(){
        return "SUCCESS";
    }
}
