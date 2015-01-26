/**
 *
 * @author Samed Ceylan
 * @link http://www.samedceylan.com/
 * @copyright 2015 SmceFramework
 * @github https://github.com/smceframework
 */
namespace Smce\Core;

class SmRouter
{
    protected router;
    protected route;
    protected request;
    /**
     * @param $request
     * 
     * 
     */
    public function setRequest(request) -> void
    {
        let this->request = request;
    }
    
    /**
     * @param $router
     * 
     * 
     */
    public function setRouter(router) -> void
    {
        let this->router = router;
    }
    
    /**
     * @param $route
     * 
     * 
     */
    public function setRoute(route) -> void
    {
        let this->route = route;
    }
    
    /**
     * run
     * 
     * @return requestArray
     */
    public function run()
    {
        var requestArray, routeGetEx, parse, requestGetEx, key, value;
    
        
        let requestArray =  ["controller" : "", "view" : ""];
        
        if empty(this->request) {
            
            let requestArray =  ["controller" : "site", "view" : "index"];
        } else {
            
            let routeGetEx =  [];
            
            if !isset this->router["showScriptName"] || this->router["showScriptName"] == false {
                
                if isset this->route {
                    let routeGetEx =  explode("/", this->route);
                    
                    let requestArray =  ["controller" : 
                    isset routeGetEx[0] ? routeGetEx[0] : "", "view" : 
                    isset routeGetEx[1] ? routeGetEx[1] : ""];
                }
            } else {
                let parse =  parse_url(this->request);
                let requestGetEx =  explode("/", parse["path"]);
                
                let requestArray =  ["controller" : 
                isset requestGetEx[0] ? requestGetEx[0] : "", "view" : 
                isset requestGetEx[1] ? requestGetEx[1] : ""];
                
                if isset $this->router["router"][$requestGetEx[0]]{

                    for key, value in $this->router["router"][$requestGetEx[0]]{
                        
                        if isset requestGetEx[key + 2] {
                            let requestArray[value] = requestGetEx[key + 2];
                        }
                    }
                } else {
                    for key, value in this->router["router"]["all"] {
                        
                        if isset requestGetEx[key + 2] {
                            let requestArray[value] = requestGetEx[key + 2];
                        }
                    }
                }
            }
        }
        
        return requestArray;
    }
    
    /**
     * @param $controllerView
     * @param $array
     * @param $baseUrl
     * 
     * @return url
     */
    public function createUrl(controllerView = "", myArray = [], baseUrl)
    {
        var str, key, value;
    
        let str = "";
        
        if isset this->router["showScriptName"] && this->router["showScriptName"] == true {
            let str .= baseUrl . "/" . controllerView;
            for key, value in myArray {
                let str .= "/" . value;
            }
        } else {
            let str .= baseUrl . "/index.php?route=" . controllerView;
            for key, value in myArray {
                let str .= sprintf("&%s=%s", key, value);
            }
        }
        
        return str;
    }
    
    /**
     * @param $controllerView
     * @param $array
     * @param $baseUrl
     * 
     * @header url
     */
    public function redirect(controllerView = "", myArray = [], baseUrl) -> void
    {
        var str, key, value;
    
        let str = "";
        
        if isset this->router["showScriptName"] && this->router["showScriptName"] == true {
            let str .= baseUrl . "/" . controllerView;
            for key, value in myArray {
                let str .= "/" . value;
            }
        } else {
            let str .= baseUrl . "/index.php?route=" . controllerView;
            for key, value in myArray {
                let str .= sprintf("&%s=%s", key, value);
            }
        }
        header("Location: " . str);
    }

}
