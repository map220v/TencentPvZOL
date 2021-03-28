package com.qq.modules.td.command.game
{
   import com.qq.CommandName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.game.unit.TDZombieData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.geom.Point;
   
   public class TDStartZombieWalkCommand extends BasicCommand
   {
       
      
      [Inject]
      public var event:CommonEvent;
      
      public function TDStartZombieWalkCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:IGameObject = this.event.readCustomParam("object");
         var _loc2_:int = this.event.readCustomParam_Number("roadIndex");
         var _loc3_:int = this.event.readCustomParam_Number("startCol");
         var _loc4_:Point = TDGameInfo.getInstance().getZombieStartWalkPos(_loc2_,_loc3_);
         _loc1_.objectModel.roadIndex = _loc2_;
         (_loc1_.objectModel as TDZombieData).startColumn = _loc3_;
         CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
            "object":_loc1_,
            "x":_loc4_.x,
            "y":_loc4_.y
         });
         (_loc1_ as BasicZombie).revive();
      }
   }
}
