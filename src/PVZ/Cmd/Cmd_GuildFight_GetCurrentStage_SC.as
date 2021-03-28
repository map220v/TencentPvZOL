package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildFight_GetCurrentStage_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFight_GetCurrentStage_SC";
      
      public static const STAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_GetCurrentStage_SC.stage","stage",1 << 3 | WireType.VARINT);
      
      public static const CURRENTSEASON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_GetCurrentStage_SC.currentSeason","currentSeason",2 << 3 | WireType.VARINT);
      
      public static const TIME:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_GetCurrentStage_SC.time","time",3 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_Time);
       
      
      private var stage$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var currentSeason$field:uint;
      
      public var time:Array;
      
      public function Cmd_GuildFight_GetCurrentStage_SC()
      {
         this.time = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFight_GetCurrentStage_SC.$MessageID;
      }
      
      public function clearStage() : void
      {
         this.hasField$0 &= 4294967294;
         this.stage$field = new uint();
      }
      
      public function get hasStage() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stage(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stage$field = param1;
      }
      
      public function get stage() : uint
      {
         return this.stage$field;
      }
      
      public function clearCurrentSeason() : void
      {
         this.hasField$0 &= 4294967293;
         this.currentSeason$field = new uint();
      }
      
      public function get hasCurrentSeason() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set currentSeason(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.currentSeason$field = param1;
      }
      
      public function get currentSeason() : uint
      {
         return this.currentSeason$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasStage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stage$field);
         }
         if(this.hasCurrentSeason)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.currentSeason$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.time.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.time[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_GetCurrentStage_SC.stage cannot be set twice.");
                  }
                  _loc3_++;
                  this.stage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_GetCurrentStage_SC.currentSeason cannot be set twice.");
                  }
                  _loc4_++;
                  this.currentSeason = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.time.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFight_Time()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
