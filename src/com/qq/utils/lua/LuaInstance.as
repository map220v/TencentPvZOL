package com.qq.utils.lua
{
   import com.hurlant.eval.ByteLoader;
   import com.hurlant.eval.CompiledESC;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class LuaInstance
   {
      
      private static var namespaceForImport:Vector.<String> = Vector.<String>(["asgui.controls","asgui.events","com.qq.utils","com.qq.display","com.qq.templates.font","com.qq.utils.lua","com.qq.modules.main.command","com.qq.modules.guide.command","com.qq.modules.td.command.ui","com.qq.modules.td.command.tips","com.qq.modules.td.command.game","com.qq.modules.td.command.game.drag","com.qq.modules.td.command","com.qq.modules.td.model","com.qq.modules.td.command.ui.TDUICmd","com.qq.modules.sound.command"]);
       
      
      private var evaluator:CompiledESC;
      
      private var importCode:String;
      
      private var nsCode:String;
      
      public function LuaInstance()
      {
         var _loc2_:int = 0;
         super();
         this.evaluator = new CompiledESC();
         this.importCode = "";
         this.nsCode = "";
         var _loc1_:Vector.<String> = LuaInstance.namespaceForImport;
         var _loc3_:int = _loc1_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.importCode += "import " + _loc1_[_loc2_] + ".*;";
            this.nsCode += "namespace fu" + (_loc2_ + 1) + " = \'" + _loc1_[_loc2_] + "\';use namespace fu" + (_loc2_ + 1) + ";";
            _loc2_++;
         }
      }
      
      public function doString(param1:String) : void
      {
         var bytes:ByteArray = null;
         var code:String = param1;
         var t1:int = getTimer();
         try
         {
            bytes = this.evaluator.eval(this.nsCode + code);
            ByteLoader.loadBytes(bytes);
         }
         catch(err:Error)
         {
         }
      }
   }
}
