namespace Smce\Core;

class SmHelper
{
    public static function array_first(command, myArray)
    {
        
        return array_shift(array_filter(myArray, command));
    }
    
    public static function array_last(command, myArray)
    {
        
        return end(array_filter(myArray, command));
    }
    
    public static function array_sort(command, myArray)
    {
        usort(myArray, command);
        
        return myArray;
    }

}
