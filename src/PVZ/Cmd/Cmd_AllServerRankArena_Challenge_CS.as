package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_AllServerRankArena_Challenge_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_AllServerRankArena_Challenge_CS";
      
      public static const OPPONENTROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_AllServerRankArena_Challenge_CS.opponentRoleId","opponentRoleId",1 << 3 | WireType.VARINT);
      
      public static const OPPONENTRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Challenge_CS.opponentRank","opponentRank",2 << 3 | WireType.VARINT);
      
      public static const CHALLENGETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Challenge_CS.challengeTimes","challengeTimes",3 << 3 | WireType.VARINT);
      
      public static const ROLEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_Challenge_CS.roleInfo","roleInfo",100 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArenaRoleInfo);
       
      
      private var opponentRoleId$field:Int64;
      
      private var opponentRank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var challengeTimes$field:uint;
      
      private var roleInfo$field:Dto_AllServerRankArenaRoleInfo;
      
      public function Cmd_AllServerRankArena_Challenge_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_AllServerRankArena_Challenge_CS.$MessageID;
      }
      
      public function clearOpponentRoleId() : void
      {
         this.opponentRoleId$field = null;
      }
      
      public function get hasOpponentRoleId() : Boolean
      {
         return this.opponentRoleId$field != null;
      }
      
      public function set opponentRoleId(param1:Int64) : void
      {
         this.opponentRoleId$field = param1;
      }
      
      public function get opponentRoleId() : Int64
      {
         return this.opponentRoleId$field;
      }
      
      public function clearOpponentRank() : void
      {
         this.hasField$0 &= 4294967294;
         this.opponentRank$field = new uint();
      }
      
      public function get hasOpponentRank() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set opponentRank(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.opponentRank$field = param1;
      }
      
      public function get opponentRank() : uint
      {
         return this.opponentRank$field;
      }
      
      public function clearChallengeTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.challengeTimes$field = new uint();
      }
      
      public function get hasChallengeTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set challengeTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.challengeTimes$field = param1;
      }
      
      public function get challengeTimes() : uint
      {
         return this.challengeTimes$field;
      }
      
      public function clearRoleInfo() : void
      {
         this.roleInfo$field = null;
      }
      
      public function get hasRoleInfo() : Boolean
      {
         return this.roleInfo$field != null;
      }
      
      public function set roleInfo(param1:Dto_AllServerRankArenaRoleInfo) : void
      {
         this.roleInfo$field = param1;
      }
      
      public function get roleInfo() : Dto_AllServerRankArenaRoleInfo
      {
         return this.roleInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasOpponentRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.opponentRoleId$field);
         }
         if(this.hasOpponentRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.opponentRank$field);
         }
         if(this.hasChallengeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeTimes$field);
         }
         if(this.hasRoleInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,100);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Challenge_CS.opponentRoleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.opponentRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Challenge_CS.opponentRank cannot be set twice.");
                  }
                  _loc4_++;
                  this.opponentRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Challenge_CS.challengeTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.challengeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 100:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Challenge_CS.roleInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.roleInfo = new Dto_AllServerRankArenaRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
