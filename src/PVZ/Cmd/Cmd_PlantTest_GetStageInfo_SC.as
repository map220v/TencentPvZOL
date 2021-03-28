package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_PlantTest_GetStageInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PlantTest_GetStageInfo_SC";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PlantTest_GetStageInfo_SC.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const CURRENTSUBCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PlantTest_GetStageInfo_SC.currentSubChapterId","currentSubChapterId",2 << 3 | WireType.VARINT);
      
      public static const MAXSUBCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PlantTest_GetStageInfo_SC.maxSubChapterId","maxSubChapterId",3 << 3 | WireType.VARINT);
      
      public static const REMAINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PlantTest_GetStageInfo_SC.remainTimes","remainTimes",4 << 3 | WireType.VARINT);
      
      public static const REWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_PlantTest_GetStageInfo_SC.rewardList","rewardList",5 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const SHOWCARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_PlantTest_GetStageInfo_SC.showCard","showCard",6 << 3 | WireType.LENGTH_DELIMITED,Dto_CardBaseInfo);
      
      public static const DEFENSEROLENAME:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_PlantTest_GetStageInfo_SC.defenseRoleName","defenseRoleName",7 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var currentSubChapterId$field:uint;
      
      private var maxSubChapterId$field:uint;
      
      private var remainTimes$field:uint;
      
      public var rewardList:Array;
      
      public var showCard:Array;
      
      public var defenseRoleName:Array;
      
      public function Cmd_PlantTest_GetStageInfo_SC()
      {
         this.rewardList = [];
         this.showCard = [];
         this.defenseRoleName = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PlantTest_GetStageInfo_SC.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearCurrentSubChapterId() : void
      {
         this.hasField$0 &= 4294967293;
         this.currentSubChapterId$field = new uint();
      }
      
      public function get hasCurrentSubChapterId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set currentSubChapterId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.currentSubChapterId$field = param1;
      }
      
      public function get currentSubChapterId() : uint
      {
         return this.currentSubChapterId$field;
      }
      
      public function clearMaxSubChapterId() : void
      {
         this.hasField$0 &= 4294967291;
         this.maxSubChapterId$field = new uint();
      }
      
      public function get hasMaxSubChapterId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set maxSubChapterId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.maxSubChapterId$field = param1;
      }
      
      public function get maxSubChapterId() : uint
      {
         return this.maxSubChapterId$field;
      }
      
      public function clearRemainTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.remainTimes$field = new uint();
      }
      
      public function get hasRemainTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set remainTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.remainTimes$field = param1;
      }
      
      public function get remainTimes() : uint
      {
         return this.remainTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasCurrentSubChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.currentSubChapterId$field);
         }
         if(this.hasMaxSubChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.maxSubChapterId$field);
         }
         if(this.hasRemainTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTimes$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.showCard.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.showCard[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.defenseRoleName.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.defenseRoleName[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PlantTest_GetStageInfo_SC.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PlantTest_GetStageInfo_SC.currentSubChapterId cannot be set twice.");
                  }
                  _loc4_++;
                  this.currentSubChapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PlantTest_GetStageInfo_SC.maxSubChapterId cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxSubChapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PlantTest_GetStageInfo_SC.remainTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.remainTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  this.rewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 6:
                  this.showCard.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardBaseInfo()));
                  break;
               case 7:
                  this.defenseRoleName.push(ReadUtils.read$TYPE_STRING(param1));
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
