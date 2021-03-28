package com.qq.modules.embattle.view.comps
{
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.modules.embattle.model.EmbattleModel;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.tencent.protobuf.Int64;
   
   public class CardItemForOnlyTeam extends DragableCard
   {
       
      
      public function CardItemForOnlyTeam()
      {
         super();
      }
      
      override public function setCardStatus(param1:int, param2:Int64) : void
      {
         var _loc3_:int = 0;
         if(param2)
         {
            _loc3_ = this.getCardTeamId(param2);
            if(_loc3_ != 0)
            {
               setEmbattle(true);
               txt_embattle.text = "上阵";
               img_embattle.source = AssetManager.GetClass("Card_bj_enbattle");
            }
            else
            {
               setEmbattle(false);
            }
         }
      }
      
      protected function getCardTeamId(param1:Int64) : int
      {
         var _loc2_:BattleCardFormationVO = GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode);
         if(_loc2_.getCardByUid(param1))
         {
            return 1;
         }
         return 0;
      }
   }
}
