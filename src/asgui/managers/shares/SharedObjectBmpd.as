package asgui.managers.shares
{
   import flash.net.SharedObject;
   
   public class SharedObjectBmpd
   {
       
      
      private var so:SharedObject;
      
      public function SharedObjectBmpd(param1:String)
      {
         super();
         this.so = SharedObject.getLocal(param1);
      }
      
      public function Has(param1:String) : Boolean
      {
         return this.so.data.hasOwnProperty(param1);
      }
      
      public function Get(param1:String) : *
      {
         return this.so.data[param1];
      }
      
      public function Set(param1:String, param2:*, param3:Boolean = false) : void
      {
         this.so.data[param1] = param2;
         if(param3)
         {
            this.Flush();
         }
      }
      
      public function Flush() : void
      {
         this.so.flush();
      }
   }
}
