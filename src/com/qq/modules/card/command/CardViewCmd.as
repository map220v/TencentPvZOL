package com.qq.modules.card.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CardViewCmd
   {
       
      
      public function CardViewCmd()
      {
         super();
      }
      
      public static function showMainWd(param1:int = 0, param2:Object = null, param3:String = "") : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","showMainWd",[param1,param2,param3]));
      }
      
      public static function saveLastCard(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","saveLastCard",[param1]));
      }
      
      public static function closeMainWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","closeMainWd",[]));
      }
      
      public static function showExpAddSelectCt(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","showExpAddSelectCt",[param1]));
      }
      
      public static function closeExpAddSelect() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","closeExpAddSelect",[]));
      }
      
      public static function showEquipList(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","showEquipList",[param1]));
      }
      
      public static function closeEquipList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","closeEquipList",[]));
      }
      
      public static function switchViewScene(param1:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchViewScene",[param1]));
      }
      
      public static function switchUpgradeScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchUpgradeScene",[param1]));
      }
      
      public static function switchForgeScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchForgeScene",[param1]));
      }
      
      public static function switchChestScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchChestScene",[param1]));
      }
      
      public static function switchPuzzleScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchPuzzleScene",[param1]));
      }
      
      public static function switchBaptizeScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchBaptizeScene",[param1]));
      }
      
      public static function switchDNAScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchDNAScene",[param1]));
      }
      
      public static function switchPlantArmorScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchPlantArmorScene",[param1]));
      }
      
      public static function switchPlantEnvolutionScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchPlantEnvolutionScene",[param1]));
      }
      
      public static function switchEquipmentScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchEquipmentScene",[]));
      }
      
      public static function switchSwapScene(param1:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchSwapScene",[param1]));
      }
      
      public static function switchCardFruitScene(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","switchCardFruitScene",[param1]));
      }
      
      public static function setSelectedCard(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","setSelectedCard",[param1]));
      }
      
      public static function setSelectedCardByForgeLevel(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","setSelectedCardByForgeLevel",[param1]));
      }
      
      public static function setSelectedCardByIndex(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","setSelectedCardByIndex",[param1]));
      }
      
      public static function setSelectedCardByUID(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","setSelectedCardByUID",[param1]));
      }
      
      public static function removeSelectedCard(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","removeSelectedCard",[param1]));
      }
      
      public static function changeDaveTalk(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","changeDaveTalk",[param1]));
      }
      
      public static function showForgeComparePanel(param1:Object, param2:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","showForgeComparePanel",[param1,param2]));
      }
      
      public static function openPuzzleBag() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","openPuzzleBag",[]));
      }
      
      public static function showPuzzleFinshPanel(param1:Object, param2:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","showPuzzleFinshPanel",[param1,param2]));
      }
      
      public static function showRecycleConfirmPanel(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","showRecycleConfirmPanel",[param1]));
      }
      
      public static function changeSwapConfig(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CardViewCommand","changeSwapConfig",[param1]));
      }
   }
}
