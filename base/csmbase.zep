/**
 *
 * @author Samed Ceylan
 * @link http://www.samedceylan.com/
 * @copyright 2015 SmceFramework
 * @github https://github.com/smceframework
 */
namespace Smce\Base;

use Smce\Core\SmRouter;

class CSmBase
{
    public static config;
    
    public static controller;
    public static view;
  
    
    
    
    /**
     * 
     * @param request
     *
     * @return SmRouter requestArray
     * 
     */
    protected function setSmRouter(request)
    {
        var SmRouter;
    
        let SmRouter =  new SmRouter();
        SmRouter->setRequest(request);
        
        if isset _GET["route"] {
            SmRouter->setRoute(_GET["route"]);
        }
        
        if isset self::config["urlrouter"] {
            SmRouter->setRouter(self::config["urlrouter"]);
        }
        
        return SmRouter->run();
    }
    
    /**
     *
     * @param requestArray
     *
     * @void
     * 
     */
    protected function setControllerView(requestArray) -> void
    {
        var key, value, controller, view;
    
		for key, value in requestArray {
			let _GET[key] = value;
		}
   
        let self::$controller =  strtolower(requestArray["controller"]);
        let self::$view =  strtolower(requestArray["view"]);
    }
    
  
   
    
    /**
     *
     *
     *
     * @void
     * 
     */
    protected function isController()
    {
        
        if class_exists(ucfirst(self::$controller) . "Controller") {
            
            return true;
        } else {
            
            return false;
        }
    }
    
    
    
    /**
     *
     *
     * @return baseUrl
     * 
     */
    public static function baseUrl()
    {
        
        return str_replace("/index.php", "", _SERVER["SCRIPT_NAME"]);
    }

}
