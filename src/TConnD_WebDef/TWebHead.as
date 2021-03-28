package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class TWebHead
   {
      
      public static const BASEVERSION:uint = 1;
      
      public static const CURRVERSION:uint = 1;
      
      public static const VERSION_Base:uint = 1;
      
      public static const VERSION_Ext:uint = 1;
       
      
      public var Base:TWebBase;
      
      public var Ext:TWebExt;
      
      public function TWebHead()
      {
         super();
         this.Base = new TWebBase();
         this.Ext = new TWebExt();
      }
      
      public function encode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc5_:int = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Base <= param2)
         {
            if(this.Base == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if((_loc4_ = this.Base.encode(param1,param2)) != ErrorMap.NO_ERROR)
            {
               return _loc4_;
            }
         }
         if(VERSION_Ext <= param2)
         {
            _loc5_ = this.Base.Cmd;
            if(this.Ext == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if((_loc4_ = this.Ext.encode(_loc5_,param1,param2)) != ErrorMap.NO_ERROR)
            {
               return _loc4_;
            }
         }
         if(param1.position < _loc3_ + 10)
         {
            return ErrorMap.ERR_NO_BUF_FOR_INDICATOR;
         }
         TdrUtil.directWriteTinyuint(param1,_loc3_ + 9,param2);
         return _loc4_;
      }
      
      public function decode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc5_:int = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         if(param1.bytesAvailable < 10)
         {
            return ErrorMap.ERR_PARTIAL_MSG;
         }
         param2 = TdrUtil.directReadTinyuint(param1,param1.position + 9);
         if(BASEVERSION > param2 || param2 > CURRVERSION)
         {
            return ErrorMap.ERR_INVALIED_CUTOFF_VERSION;
         }
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Base <= param2)
         {
            if(this.Base == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if((_loc4_ = this.Base.decode(param1,param2)) != ErrorMap.NO_ERROR)
            {
               return _loc4_;
            }
         }
         if(VERSION_Ext <= param2)
         {
            _loc5_ = this.Base.Cmd;
            if(this.Ext == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if((_loc4_ = this.Ext.decode(_loc5_,param1,param2)) != ErrorMap.NO_ERROR)
            {
               return _loc4_;
            }
         }
         return _loc4_;
      }
   }
}
