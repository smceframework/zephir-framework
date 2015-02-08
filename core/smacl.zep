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

        for value in accessRules["actions"] 
        {
           
            if isset accessRules["ip"] && this->ipAdressSearch(accessRules["ip"]) == true {
                
                return true;
            }
             
            if this->loginControl(accessRules["users"], accessRules["redirect"],loginState)==false
            {

                return false;

            }
            
            if isset accessRules["expression"] && this->expressionControl(accessRules["expression"]) == true 
            {
                
                return true;

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
     
    protected function loginControl(users="", redirect = "",loginState)
    {
       
        var router;
    
        
        if users == "@" && empty(loginState)
        {
        
            let router =  new SmRouter();
            router->redirect(redirect == "" ? "site/login" : redirect);

            return false;

        }else
        {

            return true;
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
