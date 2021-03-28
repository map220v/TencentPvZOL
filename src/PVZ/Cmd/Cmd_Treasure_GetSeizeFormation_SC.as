package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.utils.IDataInput;
   
   public final class Cmd_Treasure_GetSeizeFormation_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Treasure_GetSeizeFormation_SC";
      
      public static const FORMATIONINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Treasure_GetSeizeFormation_SC.formationInfo","formationInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FormationInfo);
      
      public static const CARDUSEDCOUNT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Treasure_GetSeizeFormation_SC.cardUsedCount","cardUsedCount",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Id64Num);
      
      public static const FORMATIONUSEDCOUNT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Treasure_GetSeizeFormation_SC.formationUsedCount","formationUsedCount",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      public var formationInfo:Array;
      
      public var cardUsedCount:Array;
      
      public var formationUsedCount:Array;
      
      public function Cmd_Treasure_GetSeizeFormation_SC()
      {
         this.formationInfo = [];
         this.cardUsedCount = [];
         this.formationUsedCount = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Treasure_GetSeizeFormation_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.formationInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formationInfo[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.cardUsedCount.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardUsedCount[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.formationUsedCount.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formationUsedCount[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc3_ >> 3)
            {
               case 1:
                  this.formationInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FormationInfo()));
                  break;
               case 2:
                  this.cardUsedCount.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Id64Num()));
                  break;
               case 3:
                  this.formationUsedCount.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc3_);
                  break;
            }
         }
      }
   }
}
