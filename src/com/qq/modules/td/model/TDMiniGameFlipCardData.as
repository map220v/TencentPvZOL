package com.qq.modules.td.model
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.FlipCardZombie;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import org.as3commons.logging.api.getLogger;
   
   public class TDMiniGameFlipCardData
   {
      
      private static var _instance:TDMiniGameFlipCardData;
       
      
      private var _cardTypeList:Array;
      
      private var _counter:int;
      
      private var _filpCheckList:Array;
      
      private var _waitFlipList:Array;
      
      public function TDMiniGameFlipCardData()
      {
         super();
      }
      
      public static function getInstance() : TDMiniGameFlipCardData
      {
         if(_instance == null)
         {
            _instance = new TDMiniGameFlipCardData();
         }
         return _instance;
      }
      
      public function reset(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this._cardTypeList = new Array();
         this._filpCheckList = new Array();
         this._waitFlipList = null;
         if(param1 % 2 == 1)
         {
            getLogger("td").error("僵尸数量非偶数");
         }
         var _loc2_:int = param1 * 0.5;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = _loc3_ % 4 + 1;
            this._cardTypeList.push(_loc5_);
            this._cardTypeList.push(_loc5_);
            _loc3_++;
         }
         var _loc4_:int = this._cardTypeList.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc6_ = DMath.randNum(0,_loc4_ - 1);
            _loc7_ = this._cardTypeList[_loc6_];
            this._cardTypeList[_loc6_] = this._cardTypeList[_loc3_];
            this._cardTypeList[_loc3_] = _loc7_;
            _loc3_++;
         }
         this._counter = 0;
      }
      
      public function addFlipZombie(param1:IGameObject) : void
      {
         var _loc2_:int = this._cardTypeList[this._counter++];
         param1.setRunningProp(TDConstant.GameObject_Prop_FlipCardType,_loc2_);
      }
      
      public function flipCard(param1:IGameObject) : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = null;
         var _loc4_:IGameObject = null;
         var _loc5_:IGameObject = null;
         CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_MGAME_OPEN_CARD));
         if(this._waitFlipList != null)
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(this._waitFlipList[0]);
            _loc3_ = TDGameInfo.getInstance().getGameObjctByUID(this._waitFlipList[1]);
            if(_loc2_ as FlipCardZombie != null && !(_loc2_ as FlipCardZombie).isPicture)
            {
               (_loc2_ as FlipCardZombie).flipToBack();
            }
            if(_loc3_ as FlipCardZombie != null && !(_loc3_ as FlipCardZombie).isPicture)
            {
               (_loc3_ as FlipCardZombie).flipToBack();
            }
            this._waitFlipList = null;
         }
         if(this._filpCheckList.length < 2)
         {
            this._filpCheckList.push(param1.uid);
         }
         if(this._filpCheckList.length == 2)
         {
            _loc4_ = TDGameInfo.getInstance().getGameObjctByUID(this._filpCheckList[0]);
            _loc5_ = TDGameInfo.getInstance().getGameObjctByUID(this._filpCheckList[1]);
            if(_loc4_ != null && _loc5_ != null)
            {
               if(_loc4_.getRunningProp(TDConstant.GameObject_Prop_FlipCardType) == _loc5_.getRunningProp(TDConstant.GameObject_Prop_FlipCardType))
               {
                  _loc4_.changeHp(-_loc4_.objectModel.maxHp.get(),TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_loc4_);
                  _loc5_.changeHp(-_loc5_.objectModel.maxHp.get(),TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_loc5_);
               }
               else
               {
                  this._waitFlipList = this._filpCheckList;
                  if(_loc4_ as FlipCardZombie != null)
                  {
                     (_loc4_ as FlipCardZombie).flippingToBack();
                  }
                  if(_loc5_ as FlipCardZombie != null)
                  {
                     (_loc5_ as FlipCardZombie).flippingToBack();
                  }
               }
            }
            this._filpCheckList = new Array();
         }
      }
   }
}
