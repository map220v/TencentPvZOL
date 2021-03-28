package com.qq.modules.embattle.view.comps
{
   import PVZ.Cmd.Dto_CardPosInfo;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.display.QProgressBar;
   import com.qq.managers.FilterManager;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.zombieIsland.constant.ZombieIslandConstant;
   import com.tencent.protobuf.Int64;
   
   public class CardItemForZombieIsland extends DragableCard
   {
       
      
      public var hpProBar:QProgressBar;
      
      public function CardItemForZombieIsland(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.hpProBar = new QProgressBar();
         this.hpProBar.bottom = 18;
         this.hpProBar.hcenter = 0;
         this.hpProBar.setSkin("City_embattle_zombieIsland_hp_bk","City_embattle_zombieIsland_hp",null,null);
         addChild(this.hpProBar);
      }
      
      override public function setData(param1:CardItemVO, param2:BattleLineupCardTemp = null) : void
      {
         super.setData(param1,param2);
         this.hpProBar.percent = param1.getZombieIslandHp(ZombieIslandConstant.curMode) / param1.hp.toNumber();
      }
      
      override public function setCardStatus(param1:int, param2:Int64) : void
      {
         var _loc3_:Dto_CardPosInfo = null;
         var _loc4_:CardItemVO = null;
         if(param2)
         {
            _loc3_ = GameGloble.actorModel.battleCardModel.getFormationInfo(ZombieIslandConstant.getEmbattleTypeByMode(ZombieIslandConstant.curMode)).getCardByUid(param2);
            if(_loc3_)
            {
               setEmbattle(true);
               txt_embattle.text = "上阵";
               img_embattle.source = AssetManager.GetClass("Card_bj_enbattle");
            }
            else if((_loc4_ = GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(param2)) && _loc4_.getZombieIslandHp(ZombieIslandConstant.curMode) == 0)
            {
               setEmbattle(true);
               txt_embattle.text = "阵亡";
               img_embattle.source = AssetManager.GetClass("Card_bj_defence");
               filters = [FilterManager.getGaryFilter()];
               mouseChildren = false;
            }
            else
            {
               filters = [];
               mouseChildren = true;
               setEmbattle(false);
            }
         }
      }
   }
}
