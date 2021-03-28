package com.qq.modules.td.logic.unit.zombie
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.model.TDMiniGameFlipCardData;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.UrlManager;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class FlipCardZombie extends BasicZombie
   {
       
      
      public var filpCardAnmi:BlitBoneAnim;
      
      public var clickArea:Sprite;
      
      private var _hideBoneList:Array;
      
      private var _cardType:int;
      
      private var _isFlipingCard:Boolean = false;
      
      private var _isPicture:Boolean = false;
      
      public function FlipCardZombie()
      {
         this._hideBoneList = ["butter","_zombie_camel_board_hump_states","_zombie_camel_board_tail_states","_zombie_camel_board_head_states"];
         super();
      }
      
      override protected function initHideBones() : void
      {
         var _loc1_:String = null;
         super.initHideBones();
         for each(_loc1_ in this._hideBoneList)
         {
            animation.setBoneVisibleRule(_loc1_,false);
         }
      }
      
      override public function revive(param1:Array = null) : void
      {
         TDMiniGameFlipCardData.getInstance().addFlipZombie(this);
         var _loc2_:ITDStaticData = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,5000,TDNormalObjectStaticInfo);
         var _loc3_:String = UrlManager.getInstance().getUrl(UrlManager.Url_TDObjectAnmi,_loc2_.resFileName + "." + GameGloble.BONE_FILE_EXT);
         this.filpCardAnmi = BlitBoneManager.impl.createBoneAnim();
         this.filpCardAnmi.data = BlitBoneManager.impl.getBoneDataByUrl(_loc3_);
         frontLayer.addChild(this.filpCardAnmi.asset.asset);
         this.resetFront();
         this.resetBehind();
         this.flipToBack();
         this.clickArea = new Sprite();
         GraphicsUtils.drawRect(this.clickArea,0,0,this.filpCardAnmi.asset.width,this.filpCardAnmi.asset.height,0,0);
         this.clickArea.buttonMode = true;
         TDUILayerManager.uiPanel.addChild(this.clickArea);
         this.clickArea.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         super.revive(param1);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(!this._isPicture)
         {
            TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Zombie_Flip_Count);
            this.flippingToPicture();
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         if(this.clickArea != null)
         {
            UtilsManager.removeFromContainer(this.clickArea);
            this.clickArea.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
            this.clickArea = null;
         }
         if(this.filpCardAnmi != null)
         {
            this.filpCardAnmi.removeEventListener(Event.COMPLETE,this.onFinishFlippingBack);
            this.filpCardAnmi.removeEventListener(Event.COMPLETE,this.onFinishFlippingPicture);
            this.filpCardAnmi.Dispose();
            this.filpCardAnmi = null;
         }
         super.dispose(param1);
      }
      
      private function resetFront() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         switch(objectModel.unitType)
         {
            case TDConstant.ZombieType_CAMEL_HEAD_FlipCard:
               _loc1_ = ["zombie_camel_board_hump_etching_norm","zombie_camel_board_tail_etching_norm"];
               break;
            case TDConstant.ZombieType_CAMEL_HUMP_FlipCard:
               _loc1_ = ["zombie_camel_board_head_etching_norm","zombie_camel_board_tail_etching_norm"];
               break;
            default:
               _loc1_ = ["zombie_camel_board_head_etching_norm","zombie_camel_board_hump_etching_norm"];
         }
         for each(_loc2_ in _loc1_)
         {
            this.filpCardAnmi.setBoneVisibleRule(_loc2_,false);
         }
      }
      
      private function resetBehind() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         this._cardType = getRunningProp(TDConstant.GameObject_Prop_FlipCardType);
         switch(this._cardType)
         {
            case 1:
               _loc1_ = ["challenge_cone","challenge_skull","challenge_sun"];
               break;
            case 2:
               _loc1_ = ["challenge_bucket","challenge_skull","challenge_sun"];
               break;
            case 3:
               _loc1_ = ["challenge_bucket","challenge_cone","challenge_sun"];
               break;
            case 4:
               _loc1_ = ["challenge_bucket","challenge_cone","challenge_skull"];
         }
         for each(_loc2_ in _loc1_)
         {
            this.filpCardAnmi.setBoneVisibleRule(_loc2_,false);
         }
      }
      
      public function get isPicture() : Boolean
      {
         return this._isPicture;
      }
      
      public function flippingToBack() : void
      {
         if(this._isFlipingCard)
         {
            this.flipToBack();
         }
         else
         {
            this._isFlipingCard = true;
            this.filpCardAnmi.gotoAndPlay("flipFront");
            this.filpCardAnmi.addEventListener(Event.COMPLETE,this.onFinishFlippingBack);
         }
      }
      
      private function onFinishFlippingBack(param1:Event) : void
      {
         this.flipToBack();
      }
      
      public function flipToBack() : void
      {
         if(this.filpCardAnmi.hasEventListener(Event.COMPLETE))
         {
            this.filpCardAnmi.removeEventListener(Event.COMPLETE,this.onFinishFlippingBack);
         }
         this._isFlipingCard = false;
         this._isPicture = false;
         this.filpCardAnmi.gotoAndStop("frontIdle");
      }
      
      public function flippingToPicture() : void
      {
         if(this._isFlipingCard)
         {
            this.flipToPicture();
         }
         else
         {
            this._isFlipingCard = true;
            this.filpCardAnmi.gotoAndPlay("flipBehind");
            this.filpCardAnmi.addEventListener(Event.COMPLETE,this.onFinishFlippingPicture);
         }
      }
      
      private function onFinishFlippingPicture(param1:Event) : void
      {
         this.flipToPicture();
      }
      
      public function flipToPicture() : void
      {
         if(this.filpCardAnmi.hasEventListener(Event.COMPLETE))
         {
            this.filpCardAnmi.removeEventListener(Event.COMPLETE,this.onFinishFlippingPicture);
         }
         this._isFlipingCard = false;
         this._isPicture = true;
         this.filpCardAnmi.gotoAndStop("behindIdle");
         TDMiniGameFlipCardData.getInstance().flipCard(this);
      }
   }
}
