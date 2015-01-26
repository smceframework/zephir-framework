/**
 *
 * @author Samed Ceylan
 * @link http://www.samedceylan.com/
 * @copyright 2015 SmceFramework
 * @github https://github.com/smceframework
 */
namespace Smce\Core;

class SmACL
{
    private ip;
    private loginState;
    /**
     * @param $accessRules
     * @param $view
     *
     * @return bool
     */
    public function rules(accessRules, view, ip = "", loginState = "") -> bool
    {
        var value;
    
        let this->ip = ip;
        let this->loginState = loginState;

        for value in accessRules {
            
            if isset value["actions"] && in_array(strtolower(view), value["actions"]) {
                
                if isset value["ip"] && this->ipAdressSearch(value["ip"]) == true {
                    
                    return true;
                }
                 
                this->loginControl(value["users"], value["redirect"]);
                
                if isset value["expression"] && this->expressionControl(value["expression"]) == true {
                    
                    return true;
                }
               
            }
        }
        
        return false;
    }
    
    /**
     * @param $ipAdress
     *
     * @return bool
     */
    protected function ipAdressSearch(ipAdress) -> bool
    {
        
        if is_array(ipAdress) {
            
            return in_array(this->ip, ipAdress);
        }

        return false;
    }
    
    /**
     * @param $users
     * @param $redirect
     *
     * @redirect url
     */
    protected function loginControl(users="", redirect = "") -> void
    {
        var controller;
        
         if users == "@" && empty this->loginState {
                let controller =  new SmController();
                controller->redirect(
                redirect == "" ? "site/login" : redirect);
            
        }
    }
    
    /**
     * @param $expression
     *
     * @return bool
     */
    protected function expressionControl(expression) -> bool
    {
        
        if expression === true {
            
            return true;
        }

        return false;
    }

}