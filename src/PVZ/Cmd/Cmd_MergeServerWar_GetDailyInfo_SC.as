package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_MergeServerWar_GetDailyInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_MergeServerWar_GetDailyInfo_SC";
      
      public static const CIRCUSINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_MergeServerWar_GetDailyInfo_SC.circusInfo","circusInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_MergeServerWar_GuildInfo);
      
      public static const PLAYGROUNDINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_MergeServerWar_GetDailyInfo_SC.playGroundInfo","playGroundInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_MergeServerWar_GuildInfo);
      
      public static const HASCIRCUSTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_MergeServerWar_GetDailyInfo_SC.hasCircusTakeReward","hasCircusTakeReward",3 << 3 | WireType.VARINT);
      
      public static const HASPLAYGROUNDTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_MergeServerWar_GetDailyInfo_SC.hasPlayGroundTakeReward","hasPlayGroundTakeReward",4 << 3 | WireType.VARINT);
       
      
      public var circusInfo:Array;
      
      public var playGroundInfo:Array;
      
      private var hasCircusTakeReward$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var hasPlayGroundTakeReward$field:Boolean;
      
      public function Cmd_MergeServerWar_GetDailyInfo_SC()
      {
         this.circusInfo = [];
         this.playGroundInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_MergeServerWar_GetDailyInfo_SC.$MessageID;
      }
      
      public function clearHasCircusTakeReward() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasCircusTakeReward$field = new Boolean();
      }
      
      public function get hasHasCircusTakeReward() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasCircusTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasCircusTakeReward$field = param1;
      }
      
      public function get hasCircusTakeReward() : Boolean
      {
         return this.hasCircusTakeReward$field;
      }
      
      public function clearHasPlayGroundTakeReward() : void
      {
         this.hasField$0 &= 4294967293;
         this.hasPlayGroundTakeReward$field = new Boolean();
      }
      
      public function get hasHasPlayGroundTakeReward() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set hasPlayGroundTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.hasPlayGroundTakeReward$field = param1;
      }
      
      public function get hasPlayGroundTakeReward() : Boolean
      {
         return this.hasPlayGroundTakeReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.circusInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.circusInfo[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.playGroundInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.playGroundInfo[_loc3_]);
            _loc3_++;
         }
         if(this.hasHasCircusTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasCircusTakeReward$field);
         }
         if(this.hasHasPlayGroundTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.hasPlayGroundTakeReward$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  this.circusInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MergeServerWar_GuildInfo()));
                  break;
               case 2:
                  this.playGroundInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MergeServerWar_GuildInfo()));
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_MergeServerWar_GetDailyInfo_SC.hasCircusTakeReward cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasCircusTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_MergeServerWar_GetDailyInfo_SC.hasPlayGroundTakeReward cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasPlayGroundTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
