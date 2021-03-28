package asgui.managers
{
   import asgui.utils.StringUtil;
   
   public class ConfigModuleXmlInfo extends ConfigXmlInfo
   {
       
      
      private var _resourceOrder:Vector.<int>;
      
      private var _cmdListenInit:Vector.<String>;
      
      private var _viewCloseToUnload:Vector.<String>;
      
      public function ConfigModuleXmlInfo(param1:String, param2:Object, param3:int = -1)
      {
         super(param1,param2,param3);
      }
      
      public function get order() : int
      {
         return xml.@order;
      }
      
      public function get resourceOrder() : Vector.<int>
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:Vector.<int> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(!this._resourceOrder)
         {
            _loc1_ = xml.@resourceOrder;
            _loc2_ = _loc1_.split(",");
            _loc3_ = new Vector.<int>();
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if((_loc5_ = _loc2_[_loc4_]) > 0)
               {
                  _loc3_.push(_loc5_);
               }
               _loc4_++;
            }
            this._resourceOrder = _loc3_;
         }
         return this._resourceOrder;
      }
      
      public function get cmdListenInit() : Vector.<String>
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:Vector.<String> = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         if(!this._cmdListenInit)
         {
            _loc1_ = xml.@cmdListenInit;
            _loc2_ = _loc1_.split(",");
            _loc3_ = new Vector.<String>();
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc5_ = _loc2_[_loc4_];
               if((_loc5_ = StringUtil.trim(_loc5_)).length > 0)
               {
                  _loc3_.push(_loc5_);
               }
               _loc4_++;
            }
            this._cmdListenInit = _loc3_;
         }
         return _loc3_;
      }
      
      public function get viewCloseToUnload() : Vector.<String>
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:Vector.<String> = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         if(!this._viewCloseToUnload)
         {
            _loc1_ = xml.@viewCloseToUnload;
            _loc2_ = _loc1_.split(",");
            _loc3_ = new Vector.<String>();
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc5_ = _loc2_[_loc4_];
               if((_loc5_ = StringUtil.trim(_loc5_)).length > 0)
               {
                  _loc3_.push(_loc5_);
               }
               _loc4_++;
            }
            this._viewCloseToUnload = _loc3_;
         }
         return _loc3_;
      }
   }
}
