package asgui.logger
{
   public class Statistic
   {
       
      
      public var children:Vector.<Statistic>;
      
      public var value:int;
      
      public var name:String;
      
      public var type:String;
      
      public var url:String;
      
      public function Statistic(param1:String = null, param2:String = null, param3:String = null, param4:int = 1)
      {
         this.children = new Vector.<Statistic>();
         super();
         this.url = param3;
         this.type = param1;
         this.name = param2;
         this.value = param4;
      }
      
      public function get tagName() : String
      {
         return "stat";
      }
      
      public function Add(param1:Statistic) : void
      {
         this.children.push(param1);
      }
      
      public function GetXmlString() : String
      {
         var _loc1_:int = 0;
         var _loc2_:* = "<" + this.tagName + " ";
         if(this.type)
         {
            _loc2_ += "type=\"" + this.type + "\" ";
         }
         if(this.name)
         {
            _loc2_ += "name=\"" + this.name + "\" ";
         }
         if(this.url)
         {
            _loc2_ += "name=\"" + this.url + "\" ";
         }
         _loc2_ += "value=\"" + this.value + "\" >";
         _loc1_ = 0;
         while(_loc1_ < this.children.length)
         {
            _loc2_ += this.children[_loc1_].GetXmlString();
            _loc1_++;
         }
         return _loc2_ + ("</" + this.tagName + ">");
      }
      
      public function AddAmountCount(param1:Array, param2:String) : void
      {
         var _loc3_:int = 0;
         if(param1[this[param2]] == null)
         {
            param1[this[param2]] = 0;
         }
         param1[this[param2]] += this.value;
         _loc3_ = 0;
         while(_loc3_ < this.children.length)
         {
            this.children[_loc3_].AddAmountCount(param1,param2);
            _loc3_++;
         }
      }
   }
}
