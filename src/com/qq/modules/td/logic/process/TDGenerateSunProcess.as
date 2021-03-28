package com.qq.modules.td.logic.process
{
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.DMath;
   import com.qq.utils.data.PData;
   import com.qq.utils.db.ClientDBTableName;
   import org.as3commons.logging.api.getLogger;
   
   public class TDGenerateSunProcess extends TDBasicProcess implements IProcess
   {
      
      public static const ID:int = 3;
       
      
      public var lastTime:Number;
      
      private var _isDropSun:Boolean;
      
      public var generatedSunNum:int;
      
      public var nextGenerateDelay:int;
      
      private var _param950:PData;
      
      private var _param425:PData;
      
      private var _param10:PData;
      
      private var _param275:PData;
      
      public function TDGenerateSunProcess()
      {
         super();
         this.lastTime = -1;
         this._param950 = new PData();
         this._param950.set(950);
         this._param425 = new PData();
         this._param425.set(425);
         this._param10 = new PData();
         this._param10.set(10);
         this._param275 = new PData();
         this._param275.set(275);
         updateDuration = int(1000 / 30);
      }
      
      override public function doProcess() : void
      {
         var _loc2_:TDNormalObjectStaticInfo = null;
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         super.doProcess();
         if(!this._isDropSun)
         {
            return;
         }
         if(isStop)
         {
            return;
         }
         if(this.nextGenerateDelay == -1)
         {
            this.nextGenerateDelay = this.getNextGenerateDelay();
         }
         var _loc1_:Number = time;
         if(this.lastTime == -1)
         {
            this.lastTime = _loc1_;
         }
         if(_loc1_ - this.lastTime > this.nextGenerateDelay)
         {
            this.lastTime = _loc1_;
            _loc2_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,TDConstant.UnitType_Sun,TDNormalObjectStaticInfo);
            _loc3_ = new Object();
            _loc3_.type = TDConstant.UnitType_Sun;
            _loc4_ = TDGameInfo.getInstance().passWarfieldPosX + _loc2_.getParam(TDConstant.NormalObj_Param_SunDropRandomStartX) + Math.random() * _loc2_.getParam(TDConstant.NormalObj_Param_SunDropRandomRandomStartX);
            _loc5_ = _loc2_.getParam(TDConstant.NormalObj_Param_SunDropRandomStartY);
            _loc6_ = TDGameInfo.getInstance().passWarfieldPosX + _loc3_.startPosX;
            _loc7_ = _loc2_.getParam(TDConstant.NormalObj_Param_SunDropRandomTargetY) + Math.random() * _loc2_.getParam(TDConstant.NormalObj_Param_SunDropRandomRandomTargetY);
            TDGameObjectCmd.generateSun(TDConstant.UnitType_Sun,_loc4_,_loc5_,_loc4_,_loc7_);
            this.nextGenerateDelay = this.getNextGenerateDelay();
            ++this.generatedSunNum;
         }
      }
      
      private function getNextGenerateDelay() : int
      {
         var _loc1_:int = (Math.min(this._param950.get(),this._param425.get() + this.generatedSunNum * this._param10.get()) + DMath.randNum(0,this._param275.get())) * this._param10.get();
         getLogger("TD").debug("下次产生阳光时间" + time + _loc1_);
         return _loc1_;
      }
      
      override public function reset() : void
      {
         this.generatedSunNum = 0;
         this.nextGenerateDelay = -1;
         this.lastTime = -1;
         this._isDropSun = TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_DropSun);
         super.reset();
      }
   }
}
