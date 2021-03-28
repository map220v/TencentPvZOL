package asgui.logger
{
   public class Statistics extends Statistic
   {
       
      
      public function Statistics(param1:String = null)
      {
         super();
         this.name = param1;
      }
      
      override public function get tagName() : String
      {
         return "statistics";
      }
      
      override public function GetXmlString() : String
      {
         var _loc1_:int = 0;
         var _loc2_:* = "<" + this.tagName + " name=\'" + name + "\' value=\'" + value + "\' >";
         _loc1_ = 0;
         while(_loc1_ < children.length)
         {
            _loc2_ += children[_loc1_].GetXmlString();
            _loc1_++;
         }
         return _loc2_ + ("</" + this.tagName + ">");
      }
      
      public function GetAmountCountBy(param1:String) : XML
      {
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc2_:Array = [];
         var _loc4_:* = "<" + this.tagName + " name=\'" + name + "\' >";
         _loc3_ = 0;
         while(_loc3_ < children.length)
         {
            children[_loc3_].AddAmountCount(_loc2_,param1);
            _loc3_++;
         }
         for(_loc5_ in _loc2_)
         {
            _loc4_ += "<stat " + "url=\"" + _loc5_ + "\"" + "value=\"" + _loc2_[_loc5_] + "\"" + " />";
         }
         _loc4_ += "</" + this.tagName + ">";
         return XML(_loc4_);
      }
   }
}
