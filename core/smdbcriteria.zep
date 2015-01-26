/**
 *
 * @author Samed Ceylan
 * @link http://www.samedceylan.com/
 * @copyright 2015 SmceFramework
 * @github https://github.com/smceframework
 */
namespace Smce\Core;

class SmDbCriteria
{
    public criteria = [];
    public function select(critical) -> void
    {
        let this->criteria["select"] = critical;
    }
    
    public function condition(critical) -> void
    {
        let this->criteria["conditions"] = critical;
    }
    
    public function limit(critical) -> void
    {
        let this->criteria["limit"] = critical;
    }
    
    public function offset(critical) -> void
    {
        let this->criteria["offset"] = critical;
    }
    
    public function order(critical) -> void
    {
        let this->criteria["order"] = critical;
    }
    
    public function from(critical) -> void
    {
        let this->criteria["from"] = critical;
    }
    
    public function group(critical) -> void
    {
        let this->criteria["group"] = critical;
    }
    
    public function having(critical) -> void
    {
        let this->criteria["having"] = critical;
    }
    
    public function join(critical) -> void
    {
        let this->criteria["joins"] = critical;
    }
    
    public function push()
    {
        
        return this->criteria;
    }

}