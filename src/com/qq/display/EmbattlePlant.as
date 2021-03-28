package com.qq.display
{
   import asgui.blit.bone.BlitBone;
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.display.IBlitDisplayObject;
   import asgui.containers.Canvas;
   import asgui.core.IDisposable;
   import asgui.resources.AssetManager;
   import com.greensock.TweenMax;
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.awake.AwakeConst;
   import com.qq.modules.battle.view.unit.UnitEffectCav;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.dummy.model.DummyZombieTemplate;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanSetting;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.utils.QBlitBoneUtil;
   import com.qq.utils.UrlManager;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class EmbattlePlant extends QCanvas implements IDisposable
   {
       
      
      private const DEFAULT_ACTION_NAME:String = "effect";
      
      protected var _animation:BlitBoneAnim;
      
      public var unitLayer:Canvas;
      
      private var shade:Bitmap;
      
      private var _scale:Number = 1;
      
      private var m_autoPlay:Boolean;
      
      private var m_awakeBackEffectLayer:Canvas;
      
      private var m_awakeFrontEffectLayer:Canvas;
      
      private var m_awakeBackEffect:UnitEffectCav;
      
      private var m_awakeFrontEffect:UnitEffectCav;
      
      private var m_DNABackEffect:UnitEffectCav;
      
      private var m_DNAFrontEffect:UnitEffectCav;
      
      private var m_plantArmorEffect:UnitEffectCav;
      
      private var m_plantArmorTween:TweenMax;
      
      private var avatarId:uint;
      
      private var awakeLevel:int;
      
      private var _dnaEffectLoadFinishCount:int = 0;
      
      public function EmbattlePlant(param1:Class = null, param2:Boolean = true)
      {
         super(!!param1 ? param1 : EmbattlePlantMediator);
         this.m_autoPlay = param2;
         this.initialize();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
      }
      
      protected function initialize() : void
      {
         this.m_awakeBackEffectLayer = new Canvas();
         this.m_awakeBackEffectLayer.scrollRectEnabled = false;
         this.m_awakeBackEffectLayer.mouseEnabled = this.m_awakeBackEffectLayer.mouseChildren = false;
         addChild(this.m_awakeBackEffectLayer);
         this.unitLayer = new Canvas();
         this.unitLayer.scrollRectEnabled = false;
         scrollRectEnabled = false;
         addChild(this.unitLayer);
         this.m_awakeFrontEffectLayer = new Canvas();
         this.m_awakeFrontEffectLayer.scrollRectEnabled = false;
         this.m_awakeFrontEffectLayer.mouseEnabled = this.m_awakeFrontEffectLayer.mouseChildren = false;
         addChild(this.m_awakeFrontEffectLayer);
         this.width = 100;
         this.height = 100;
      }
      
      override public function Dispose() : void
      {
         if(this._animation)
         {
            this._animation.Dispose();
         }
         this._animation = null;
         this.removeAwakeEffect();
         this.removeDNAEffect();
         this.removePlantArmorEffect();
         super.Dispose();
      }
      
      public function setDummyAssetUrl(param1:DummyZombieTemplate) : void
      {
         var _loc2_:String = null;
         if(param1 != null)
         {
            _loc2_ = UrlManager.getUrl(UrlManager.Url_Battle_Unit,param1.unitAssetName);
            if(this._animation && this._animation.data && this._animation.data.url == _loc2_)
            {
               return;
            }
            if(this._animation && (!this._animation.data || this._animation.data.url != _loc2_))
            {
               this._animation.Dispose();
               this._animation = null;
            }
            if(!this._animation)
            {
               this._animation = BlitBoneManager.impl.createBoneAnim(BlitBone.TYPE_USE_UNDEFAULT_BLIT_FACTORY);
               this.unitLayer.addChild(this._animation.asset.asset);
               if(_loc2_)
               {
                  this._animation.data = BlitBoneManager.impl.getBoneDataByUrl(_loc2_,false);
               }
            }
            this.unitLayer.visible = true;
            this.unitLayer.scaleX = this.unitLayer.scaleY = this._scale;
            if(this.m_autoPlay)
            {
               this._animation.gotoAndPlay("idle",0);
            }
            else
            {
               this._animation.gotoAndStop("idle",0);
            }
         }
         else if(this._animation)
         {
            this._animation.Dispose();
            this._animation = null;
         }
      }
      
      public function setBattleCardAssetUrl(param1:BattleLineupCardTemp, param2:uint, param3:Boolean = false) : void
      {
         var _loc5_:PlanSetting = null;
         var _loc4_:String = null;
         if(param1)
         {
            if((_loc5_ = SettingsModel.instance.battleCartoonSettings.getPlanSetting(param1.planClassName)) == null)
            {
               return;
            }
            _loc4_ = UrlManager.getUrl(UrlManager.Url_Battle_Unit,_loc5_.assetTree.unitAssetName);
         }
         if(this._animation && this._animation.data && this._animation.data.url == _loc4_ && this.avatarId == param2)
         {
            if(!param3)
            {
               this.updateCardEffect(param1.awakeLevel);
            }
         }
         else
         {
            this.avatarId = param2;
            if(this._animation && (!this._animation.data || this._animation.data.url != _loc4_))
            {
               this._animation.Dispose();
               this._animation = null;
            }
            if(!this._animation)
            {
               this._animation = BlitBoneManager.impl.createBoneAnim(BlitBone.TYPE_USE_UNDEFAULT_BLIT_FACTORY);
               this.unitLayer.addChild(this._animation.asset.asset);
               if(_loc4_)
               {
                  this._animation.data = BlitBoneManager.impl.getBoneDataByUrl(_loc4_,false);
               }
            }
            if(!param1)
            {
               this._animation.stop();
               this.unitLayer.visible = false;
               return;
            }
            this.unitLayer.visible = true;
            this._animation.clearAllBoneVisibleRules();
            this.unitLayer.scaleX = this.unitLayer.scaleY = this._scale;
            if(this.m_autoPlay)
            {
               this._animation.gotoAndPlay("idle",0);
            }
            else
            {
               this._animation.gotoAndStop("idle",0);
            }
            if(param2 == 0)
            {
               QBlitBoneUtil.useDefaultAvatar(this._animation,param1.tdId);
            }
            else
            {
               this.setAvatar(CardTemplateFactory.instance.getPlantAvatarByAvatarId(param2));
            }
            if(!param3)
            {
               this.updateCardEffect(param1.awakeLevel);
            }
         }
      }
      
      public function setTdAssetUrl(param1:int) : void
      {
         var _loc2_:String = TDPlantBaseStaticInfo(DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,param1,TDPlantBaseStaticInfo)).resFileUrl;
         this.setShadow(true);
         if(this._animation && (!this._animation.data || this._animation.data.url != _loc2_))
         {
            this._animation.Dispose();
            this._animation = null;
         }
         this.unitLayer.visible = true;
         if(!this._animation)
         {
            this._animation = BlitBoneManager.impl.createBoneAnim(BlitBone.TYPE_USE_UNDEFAULT_BLIT_FACTORY);
            this.unitLayer.addChild(this._animation.asset.asset);
            if(_loc2_)
            {
               this._animation.data = BlitBoneManager.impl.getBoneDataByUrl(_loc2_,false);
            }
         }
         this._animation.clearAllBoneVisibleRules();
         this.unitLayer.scaleX = this.unitLayer.scaleY = this._scale;
         if(this.m_autoPlay)
         {
            this._animation.gotoAndPlay("idle",0);
         }
         else
         {
            this._animation.gotoAndStop("idle",0);
         }
      }
      
      public function setAssetUrl(param1:String, param2:String) : void
      {
         if(this._animation && (!this._animation.data || this._animation.data.url != param1))
         {
            this._animation.Dispose();
            this._animation = null;
         }
         this.unitLayer.visible = true;
         if(!this._animation)
         {
            this._animation = BlitBoneManager.impl.createBoneAnim(BlitBone.TYPE_USE_UNDEFAULT_BLIT_FACTORY);
            this.unitLayer.addChild(this._animation.asset.asset);
            if(param1)
            {
               this._animation.data = BlitBoneManager.impl.getBoneDataByUrl(param1,false);
            }
         }
         if(param2 != null)
         {
            this._animation.gotoAndPlay(param2,0);
         }
      }
      
      public function updateCardEffect(param1:int = -1, param2:int = -1, param3:int = -1) : void
      {
         if(param1 != -1)
         {
            this.switchAwakeEffect(param1);
         }
         if(param2 != -1)
         {
            this.switchDNAEffect(param2);
         }
         if(param3 != -1)
         {
            this.switchPlantArmorEffect(param3);
         }
      }
      
      private function onFinishLoadDNAEffect(param1:Event) : void
      {
         ++this._dnaEffectLoadFinishCount;
         if(this._dnaEffectLoadFinishCount >= 2)
         {
            this._dnaEffectLoadFinishCount = 0;
            if(this.m_DNABackEffect != null && !this.m_DNABackEffect.hasDisposed)
            {
               this.m_DNABackEffect.anim.gotoAndPlay("idle",0);
            }
            if(this.m_DNAFrontEffect != null && !this.m_DNAFrontEffect.hasDisposed)
            {
               this.m_DNAFrontEffect.anim.gotoAndPlay("idle",0);
            }
         }
      }
      
      private function switchPlantArmorEffect(param1:int) : void
      {
         var _loc2_:String = null;
         if(param1 > 0)
         {
            this.removePlantArmorEffect();
            _loc2_ = UrlManager.getUrl(UrlManager.Url_PlantArmor_Effect,"effect" + param1 + ".bbone");
            this.m_plantArmorEffect = new UnitEffectCav(_loc2_,"idle");
            this.m_plantArmorEffect.x = 15;
            this.m_plantArmorEffect.scaleX = this.m_plantArmorEffect.scaleY = 0.55;
            this.m_plantArmorEffect.mouseChildren = false;
            this.m_plantArmorEffect.mouseEnabled = false;
            this.m_plantArmorEffect.alpha = 0;
            this.m_awakeFrontEffectLayer.addChild(this.m_plantArmorEffect);
            this.m_plantArmorTween = TweenMax.fromTo(this.m_plantArmorEffect,2,{"alpha":0},{
               "alpha":1,
               "delay":3
            });
            this.m_plantArmorTween.repeatDelay = 5;
            this.m_plantArmorTween.repeat = -1;
            this.m_plantArmorTween.yoyo = true;
         }
         else
         {
            this.removePlantArmorEffect();
         }
      }
      
      public function removePlantArmorEffect() : void
      {
         if(this.m_plantArmorTween != null)
         {
            this.m_plantArmorTween.kill();
            this.m_plantArmorTween = null;
         }
         if(this.m_plantArmorEffect)
         {
            if(this.m_awakeFrontEffectLayer.contains(this.m_plantArmorEffect))
            {
               this.m_awakeFrontEffectLayer.removeChild(this.m_plantArmorEffect);
            }
            if(!this.m_plantArmorEffect.hasDisposed)
            {
               this.m_plantArmorEffect.Dispose();
               this.m_plantArmorEffect = null;
            }
         }
      }
      
      private function switchDNAEffect(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(param1 > 0)
         {
            this.removeDNAEffect();
            if(param1 > 0)
            {
               _loc2_ = UrlManager.getUrl(UrlManager.Url_DNA_Effect,"dna_back_effect" + param1 + ".bbone");
               this.m_DNABackEffect = new UnitEffectCav(_loc2_,"idle");
               this.m_DNABackEffect.anim.addEventListener(Event.COMPLETE,this.onFinishLoadDNAEffect);
               this.m_DNABackEffect.mouseChildren = false;
               this.m_DNABackEffect.mouseEnabled = false;
               this.m_DNABackEffect.scaleX = this.m_DNABackEffect.scaleY = 0.55;
               this.m_awakeBackEffectLayer.addChild(this.m_DNABackEffect);
               this.m_DNABackEffect.anim.frameRate = 50;
               this.m_DNABackEffect.anim.gotoAndPlay("idle",0);
               _loc3_ = UrlManager.getUrl(UrlManager.Url_DNA_Effect,"dna_front_effect" + param1 + ".bbone");
               this.m_DNAFrontEffect = new UnitEffectCav(_loc3_,"idle");
               this.m_DNAFrontEffect.anim.stop();
               this.m_DNAFrontEffect.anim.addEventListener(Event.COMPLETE,this.onFinishLoadDNAEffect);
               this.m_DNAFrontEffect.mouseEnabled = false;
               this.m_DNAFrontEffect.mouseChildren = false;
               this.m_DNAFrontEffect.scaleX = this.m_DNAFrontEffect.scaleY = 0.55;
               this.m_awakeFrontEffectLayer.addChild(this.m_DNAFrontEffect);
               this.m_DNAFrontEffect.anim.frameRate = 50;
               this.m_DNAFrontEffect.anim.gotoAndPlay("idle",0);
            }
         }
         else
         {
            this.removeDNAEffect();
         }
      }
      
      public function removeDNAEffect() : void
      {
         this._dnaEffectLoadFinishCount = 0;
         if(this.m_DNABackEffect)
         {
            if(this.m_awakeBackEffectLayer.contains(this.m_DNABackEffect))
            {
               this.m_awakeBackEffectLayer.removeChild(this.m_DNABackEffect);
            }
            if(!this.m_DNABackEffect.hasDisposed)
            {
               this.m_DNABackEffect.anim.removeEventListener(Event.COMPLETE,this.onFinishLoadDNAEffect);
               this.m_DNABackEffect.Dispose();
               this.m_DNABackEffect = null;
            }
         }
         if(this.m_DNAFrontEffect)
         {
            if(this.m_awakeFrontEffectLayer.contains(this.m_DNAFrontEffect))
            {
               this.m_awakeFrontEffectLayer.removeChild(this.m_DNAFrontEffect);
            }
            if(!this.m_DNAFrontEffect.hasDisposed)
            {
               this.m_DNAFrontEffect.anim.removeEventListener(Event.COMPLETE,this.onFinishLoadDNAEffect);
               this.m_DNAFrontEffect.Dispose();
               this.m_DNAFrontEffect = null;
            }
         }
      }
      
      private function switchAwakeEffect(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         this.awakeLevel = param1;
         if(param1 > 0)
         {
            this.removeAwakeEffect();
            if(param1 <= AwakeConst.MAX_AWAKE_LEVEL && param1 > 0)
            {
               _loc2_ = UrlManager.getUrl(UrlManager.Url_Awake_Effect,"effect_back_" + param1 + ".bbone");
               this.m_awakeBackEffect = new UnitEffectCav(_loc2_,this.DEFAULT_ACTION_NAME);
               this.m_awakeBackEffect.mouseChildren = false;
               this.m_awakeBackEffect.mouseEnabled = false;
               if(param1 == 5)
               {
                  this.m_awakeBackEffect.anim.frameRate = 20;
               }
               else
               {
                  this.m_awakeBackEffect.anim.frameRate = 30;
               }
               this.m_awakeBackEffectLayer.addChild(this.m_awakeBackEffect);
               this.m_awakeBackEffect.anim.gotoAndPlay(this.DEFAULT_ACTION_NAME,0);
               if(param1 > 1)
               {
                  _loc3_ = UrlManager.getUrl(UrlManager.Url_Awake_Effect,"effect_front_" + param1 + ".bbone");
                  this.m_awakeFrontEffect = new UnitEffectCav(_loc3_,this.DEFAULT_ACTION_NAME);
                  this.m_awakeFrontEffect.mouseEnabled = false;
                  this.m_awakeFrontEffect.mouseChildren = false;
                  if(param1 == 5)
                  {
                     this.m_awakeFrontEffect.anim.frameRate = 20;
                  }
                  else
                  {
                     this.m_awakeFrontEffect.anim.frameRate = 30;
                  }
                  this.m_awakeFrontEffectLayer.addChild(this.m_awakeFrontEffect);
                  this.m_awakeFrontEffect.anim.gotoAndPlay(this.DEFAULT_ACTION_NAME,0);
               }
            }
            this.setShadow(false);
         }
         else
         {
            this.removeAwakeEffect();
            this.setShadow(true);
         }
      }
      
      public function removeAwakeEffect() : void
      {
         if(this.m_awakeBackEffect)
         {
            if(this.m_awakeBackEffectLayer.contains(this.m_awakeBackEffect))
            {
               this.m_awakeBackEffectLayer.removeChild(this.m_awakeBackEffect);
            }
            if(!this.m_awakeBackEffect.hasDisposed)
            {
               this.m_awakeBackEffect.Dispose();
               this.m_awakeBackEffect = null;
            }
         }
         if(this.m_awakeFrontEffect)
         {
            if(this.m_awakeFrontEffectLayer.contains(this.m_awakeFrontEffect))
            {
               this.m_awakeFrontEffectLayer.removeChild(this.m_awakeFrontEffect);
            }
            if(!this.m_awakeFrontEffect.hasDisposed)
            {
               this.m_awakeFrontEffect.Dispose();
               this.m_awakeFrontEffect = null;
            }
         }
      }
      
      public function set Scale(param1:Number) : void
      {
         this._scale = param1;
         if(this._animation)
         {
            this.unitLayer.scaleX = this.unitLayer.scaleY = param1;
            this.m_awakeFrontEffectLayer.scaleX = this.m_awakeFrontEffectLayer.scaleY = this.m_awakeBackEffectLayer.scaleX = this.m_awakeBackEffectLayer.scaleY = param1;
         }
      }
      
      public function get Scale() : Number
      {
         return this._scale;
      }
      
      public function setShadow(param1:Boolean) : void
      {
         if(!this.shade)
         {
            this.shade = new Bitmap(AssetManager.GetNewClass("farm_shade") as BitmapData);
            this.shade.x = -this.shade.width / 2;
            this.shade.y = -this.shade.height / 2;
            this.unitLayer.addChildAt(this.shade,0);
         }
         this.shade.visible = param1;
      }
      
      public function setAvatar(param1:CardChestAvatarTemp) : void
      {
         QBlitBoneUtil.updateAvatar(this._animation,param1);
      }
      
      public function setHideBones(param1:Array) : void
      {
         var _loc2_:IBlitDisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(this._animation == null)
         {
            return;
         }
         if(param1 && param1.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               _loc4_ = param1[_loc3_];
               this._animation.setBoneVisibleRule(_loc4_,false);
               _loc3_++;
            }
         }
         this._animation.setBoneVisibleRule(TDConstant.Ground_LayerName,false);
         this._animation.setBoneVisibleRule(TDConstant.Ground_LayerName2,false);
      }
      
      public function setAssetPoint(param1:Number, param2:Number) : void
      {
         this.unitLayer.x = param1;
         this.unitLayer.y = param2;
         this.m_awakeBackEffectLayer.x = param1;
         this.m_awakeBackEffectLayer.y = param2;
         this.m_awakeFrontEffectLayer.x = param1;
         this.m_awakeFrontEffectLayer.y = param2;
      }
      
      public function scaleEffect(param1:Number = 1) : void
      {
         this.m_awakeBackEffectLayer.scaleX = this.m_awakeBackEffectLayer.scaleY = param1;
         this.m_awakeFrontEffectLayer.scaleX = this.m_awakeFrontEffectLayer.scaleY = param1;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         this.m_awakeBackEffectLayer.visible = param1;
         this.m_awakeFrontEffectLayer.visible = param1;
      }
   }
}
