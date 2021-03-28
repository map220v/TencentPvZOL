package asgui.blit.data
{
   import asgui.core.IDisposable;
   import asgui.logger.Statistic;
   import asgui.logger.Statistics;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class BlitDataManager
   {
      
      private static var _impl:BlitDataManager;
      
      public static var bitmapMap:Dictionary = new Dictionary();
       
      
      private var data:Array;
      
      public function BlitDataManager()
      {
         super();
         this.data = [];
      }
      
      public static function get impl() : BlitDataManager
      {
         if(_impl == null)
         {
            _impl = new BlitDataManager();
         }
         return _impl;
      }
      
      public static function GetBlitDataByUrl(param1:String, param2:Boolean = true, param3:int = 65535, param4:Boolean = true, param5:Number = NaN, param6:Number = 1, param7:ColorTransform = null, param8:Boolean = false) : BlitData
      {
         return impl.GetBlitDataByUrl(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public static function GetBlitDataByClass(param1:Class, param2:int = 65535, param3:Number = NaN, param4:Number = 1, param5:ColorTransform = null) : BlitData
      {
         return impl.GetBlitDataByClass(param1,param2,param3,param4,param5);
      }
      
      public static function GetBlitDataByObject(param1:DisplayObject, param2:int = 65535, param3:Number = NaN, param4:Number = 1, param5:ColorTransform = null) : BlitData
      {
         return impl.GetBlitDataByObject(param1,param2,param3,param4,param5);
      }
      
      public static function ClearDataBefore(param1:int) : int
      {
         return impl.ClearDataBefore(param1);
      }
      
      public static function CleanAndDisposeBlitData(param1:BlitData) : void
      {
         impl.CleanAndDisposeBlitData(param1);
      }
      
      public static function ClearExternalBitmapMap(param1:int) : void
      {
         impl.ClearExternalBitmapMap();
      }
      
      private function GetBlitDataByUrl(param1:String, param2:Boolean, param3:int, param4:Boolean, param5:Number = NaN, param6:Number = 1, param7:ColorTransform = null, param8:Boolean = false) : BlitData
      {
         var _loc9_:BlitData = null;
         param1 += !!param7 ? "_" + param7 : "";
         if(this.data[param1] == null || (this.data[param1] as BlitData).hasDisposed)
         {
            (_loc9_ = new BlitData(param3,false,param7)).allwaysSustained = param8;
            _loc9_.LoadByUrl(param1,param5,param6);
            if(param4)
            {
               this.data[param1] = _loc9_;
            }
         }
         else
         {
            _loc9_ = this.data[param1] as BlitData;
         }
         _loc9_.UpdateTime();
         return _loc9_;
      }
      
      private function GetBlitDataByClass(param1:Class, param2:int = 65535, param3:Number = NaN, param4:Number = 1, param5:ColorTransform = null) : BlitData
      {
         var _loc6_:String = (_loc6_ = String(param1)) + (!!param5 ? "_" + param5 : "");
         if(this.data[_loc6_] == null || (this.data[_loc6_] as BlitData).hasDisposed)
         {
            this.data[_loc6_] = new BlitData(param2,false,param5);
            (this.data[_loc6_] as BlitData).LoadByClass(param1,param3,param4);
         }
         (this.data[_loc6_] as BlitData).UpdateTime();
         return this.data[_loc6_] as BlitData;
      }
      
      private function GetBlitDataByObject(param1:DisplayObject, param2:int = 65535, param3:Number = NaN, param4:Number = 1, param5:ColorTransform = null) : BlitData
      {
         var _loc6_:BlitData = null;
         (_loc6_ = new BlitData(param2,false,param5)).LoadByObject(param1,param3,param4);
         _loc6_.UpdateTime();
         return _loc6_;
      }
      
      public function GetExternalBitmapMapByKey(param1:*) : Object
      {
         if(bitmapMap[param1] == null)
         {
            return null;
         }
         return bitmapMap[param1][0];
      }
      
      public function DeleteExternalBitmapMapByKey(param1:*) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:BitmapData = null;
         if(bitmapMap[param1] != null)
         {
            _loc2_ = bitmapMap[param1][0];
            if(_loc2_ is IDisposable)
            {
               (_loc2_ as IDisposable).Dispose();
            }
            else if(_loc2_.hasOwnProperty("dispose"))
            {
               _loc2_.dispose();
            }
            if(_loc2_.hasOwnProperty("parent") && _loc2_.parent.hasOwnProperty("dispose"))
            {
               _loc2_.parent.dispose();
            }
            delete bitmapMap[param1];
            if(param1 is BitmapData && param1 != BlitData.BITMAPDATA_BLANK)
            {
               _loc3_ = param1;
               if(_loc3_)
               {
                  _loc3_.dispose();
               }
            }
            return _loc2_;
         }
         return null;
      }
      
      public function GetExternalBitmapMapByName(param1:String) : Object
      {
         var _loc2_:* = undefined;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         for(_loc2_ in bitmapMap)
         {
            _loc3_ = bitmapMap[_loc2_][0];
            if((_loc4_ = bitmapMap[_loc2_][1]) == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function SetExternalBitmapMap(param1:*, param2:Object, param3:String = null) : void
      {
         bitmapMap[param1] = [param2,param3];
      }
      
      public function ClearExternalBitmapMap() : void
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         for(_loc2_ in bitmapMap)
         {
            _loc1_.push(_loc2_);
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            this.DeleteExternalBitmapMapByKey(_loc1_[_loc3_]);
            _loc3_++;
         }
         bitmapMap = new Dictionary();
      }
      
      public function GetExternalBitmapMapStatistics() : Statistics
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc2_:int = 0;
         var _loc5_:Statistics = new Statistics();
         for(_loc6_ in bitmapMap)
         {
            _loc7_ = bitmapMap[_loc6_][0];
            _loc8_ = bitmapMap[_loc6_][1];
            _loc9_ = _loc7_;
            _loc5_.Add(new Statistic(_loc9_,_loc8_,null,0));
         }
         return _loc5_;
      }
      
      public function ClearDataBefore(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc5_:BlitData = null;
         var _loc3_:Number = getTimer() - param1;
         for(_loc4_ in this.data)
         {
            if((_loc5_ = this.data[_loc4_]) != null)
            {
               if(!_loc5_.allwaysSustained && (param1 == 0 || _loc5_.accessTime < _loc3_))
               {
                  _loc5_.Dispose();
                  delete this.data[_loc4_];
                  _loc2_++;
               }
            }
         }
         return _loc2_;
      }
      
      public function CleanAndDisposeBlitData(param1:BlitData) : void
      {
         var _loc2_:BlitData = null;
         for each(_loc2_ in this.data)
         {
            if(_loc2_ == param1)
            {
               _loc2_.Dispose();
               delete this.data[_loc2_.url];
               break;
            }
         }
         param1.Dispose();
      }
      
      public function GetBlitDatasMemSize(param1:Boolean = false) : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:BlitData = null;
         var _loc3_:int = 0;
         if(!param1)
         {
         }
         for each(_loc6_ in this.data)
         {
            if(_loc6_ != null)
            {
               _loc4_ = _loc6_.GetTotalPixelSize() * 4;
               _loc5_ = _loc6_.totalFrames;
               if(!param1)
               {
               }
               _loc3_ += _loc4_;
            }
         }
         if(!param1)
         {
         }
         return _loc3_;
      }
   }
}
