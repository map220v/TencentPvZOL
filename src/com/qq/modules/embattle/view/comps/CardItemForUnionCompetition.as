package com.qq.modules.embattle.view.comps
{
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.tencent.protobuf.Int64;
   
   public class CardItemForUnionCompetition extends DragableCard
   {
       
      
      public function CardItemForUnionCompetition(param1:Class = null)
      {
         super(param1);
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
               txt_embattle.text = "阵" + _loc3_;
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
         var _loc2_:Vector.<BattleCardFormationVO> = GameGloble.actorModel.battleCardModel.getEmbattleTeam(EmbattleConst.MODE_UNION_COMPETITION);
         if(!_loc2_)
         {
            return 0;
         }
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_].getCardByUid(param1))
            {
               return _loc2_[_loc4_].teamId;
            }
            _loc4_++;
         }
         return 0;
      }
   }
}
