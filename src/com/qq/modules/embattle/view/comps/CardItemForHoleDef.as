package com.qq.modules.embattle.view.comps
{
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.main.model.ActorBattleCardModel;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.qq.templates.font.FontHKHB;
   import com.tencent.protobuf.Int64;
   
   public class CardItemForHoleDef extends DragableCard
   {
       
      
      public function CardItemForHoleDef()
      {
         super();
      }
      
      override public function setCardStatus(param1:int, param2:Int64) : void
      {
         var _loc3_:ActorBattleCardModel = null;
         var _loc4_:uint = 0;
         var _loc5_:BattleCardFormationVO = null;
         var _loc6_:Vector.<BattleCardFormationVO> = null;
         var _loc7_:Boolean = false;
         if(param2)
         {
            _loc3_ = GameGloble.actorModel.battleCardModel;
            _loc4_ = EmbattleConst.MODE_HOLE_DEF;
            if((_loc5_ = _loc3_.getFormationInfo(_loc4_)).hasCardByUid(param2))
            {
               setEmbattle(true);
               txt_embattle.text = FontHKHB.COMM_EMBATTLE_STATUS_1;
               img_embattle.source = AssetManager.GetClass("Card_bj_enbattle");
               mouseChildren = true;
            }
            else
            {
               _loc6_ = _loc3_.getEmbattleTeam(_loc4_);
               _loc7_ = true;
               for each(_loc5_ in _loc6_)
               {
                  if(_loc5_.hasCardByUid(param2))
                  {
                     setEmbattle(true);
                     txt_embattle.text = FontHKHB.COMM_EMBATTLE_STATUS_6;
                     img_embattle.source = AssetManager.GetClass("Card_bj_defence");
                     mouseChildren = false;
                     _loc7_ = false;
                     break;
                  }
               }
               if(_loc7_)
               {
                  setEmbattle(false);
                  mouseChildren = true;
               }
            }
         }
      }
   }
}
