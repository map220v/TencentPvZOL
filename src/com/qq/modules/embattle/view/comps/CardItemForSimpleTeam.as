package com.qq.modules.embattle.view.comps
{
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.tencent.protobuf.Int64;
   
   public class CardItemForSimpleTeam extends DragableCard
   {
       
      
      private var _checkTeamType:int;
      
      public function CardItemForSimpleTeam(param1:int)
      {
         super(null);
         this._checkTeamType = param1;
      }
      
      override public function setCardStatus(param1:int, param2:Int64) : void
      {
         if(param2)
         {
            if(this.IsInTheTeam(param2) == true)
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
      
      protected function IsInTheTeam(param1:Int64) : Boolean
      {
         var _loc2_:BattleCardFormationVO = GameGloble.actorModel.battleCardModel.getFormationInfo(this._checkTeamType);
         if(!_loc2_)
         {
            return false;
         }
         var _loc3_:int = _loc2_.cardNum;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.getCardByUid(param1))
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
   }
}
