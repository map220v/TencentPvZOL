package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ArenaRecorder extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ArenaRecorder";
      
      public static const REPORTUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ArenaRecorder.reportUid","reportUid",1 << 3 | WireType.VARINT);
      
      public static const ENEMYROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ArenaRecorder.enemyRoleId","enemyRoleId",2 << 3 | WireType.VARINT);
      
      public static const ENEMYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ArenaRecorder.enemyName","enemyName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ENEMYFACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ArenaRecorder.enemyFaceId","enemyFaceId",4 << 3 | WireType.VARINT);
      
      public static const ENEMYLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ArenaRecorder.enemyLevel","enemyLevel",5 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ArenaRecorder.score","score",6 << 3 | WireType.VARINT);
      
      public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_ArenaRecorder.win","win",7 << 3 | WireType.VARINT);
      
      public static const ATTACK:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_ArenaRecorder.attack","attack",8 << 3 | WireType.VARINT);
      
      public static const ENEMYQQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ArenaRecorder.enemyQQFaceURL","enemyQQFaceURL",9 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var reportUid$field:Int64;
      
      private var enemyRoleId$field:Int64;
      
      private var enemyName$field:String;
      
      private var enemyFaceId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var enemyLevel$field:uint;
      
      private var score$field:uint;
      
      private var win$field:Boolean;
      
      private var attack$field:Boolean;
      
      private var enemyQQFaceURL$field:String;
      
      public function Dto_ArenaRecorder()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ArenaRecorder.$MessageID;
      }
      
      public function clearReportUid() : void
      {
         this.reportUid$field = null;
      }
      
      public function get hasReportUid() : Boolean
      {
         return this.reportUid$field != null;
      }
      
      public function set reportUid(param1:Int64) : void
      {
         this.reportUid$field = param1;
      }
      
      public function get reportUid() : Int64
      {
         return this.reportUid$field;
      }
      
      public function clearEnemyRoleId() : void
      {
         this.enemyRoleId$field = null;
      }
      
      public function get hasEnemyRoleId() : Boolean
      {
         return this.enemyRoleId$field != null;
      }
      
      public function set enemyRoleId(param1:Int64) : void
      {
         this.enemyRoleId$field = param1;
      }
      
      public function get enemyRoleId() : Int64
      {
         return this.enemyRoleId$field;
      }
      
      public function clearEnemyName() : void
      {
         this.enemyName$field = null;
      }
      
      public function get hasEnemyName() : Boolean
      {
         return this.enemyName$field != null;
      }
      
      public function set enemyName(param1:String) : void
      {
         this.enemyName$field = param1;
      }
      
      public function get enemyName() : String
      {
         return this.enemyName$field;
      }
      
      public function clearEnemyFaceId() : void
      {
         this.hasField$0 &= 4294967294;
         this.enemyFaceId$field = new uint();
      }
      
      public function get hasEnemyFaceId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set enemyFaceId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.enemyFaceId$field = param1;
      }
      
      public function get enemyFaceId() : uint
      {
         return this.enemyFaceId$field;
      }
      
      public function clearEnemyLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.enemyLevel$field = new uint();
      }
      
      public function get hasEnemyLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set enemyLevel(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.enemyLevel$field = param1;
      }
      
      public function get enemyLevel() : uint
      {
         return this.enemyLevel$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967291;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967287;
         this.win$field = new Boolean();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set win(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.win$field = param1;
      }
      
      public function get win() : Boolean
      {
         return this.win$field;
      }
      
      public function clearAttack() : void
      {
         this.hasField$0 &= 4294967279;
         this.attack$field = new Boolean();
      }
      
      public function get hasAttack() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set attack(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.attack$field = param1;
      }
      
      public function get attack() : Boolean
      {
         return this.attack$field;
      }
      
      public function clearEnemyQQFaceURL() : void
      {
         this.enemyQQFaceURL$field = null;
      }
      
      public function get hasEnemyQQFaceURL() : Boolean
      {
         return this.enemyQQFaceURL$field != null;
      }
      
      public function set enemyQQFaceURL(param1:String) : void
      {
         this.enemyQQFaceURL$field = param1;
      }
      
      public function get enemyQQFaceURL() : String
      {
         return this.enemyQQFaceURL$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReportUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.reportUid$field);
         }
         if(this.hasEnemyRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.enemyRoleId$field);
         }
         if(this.hasEnemyName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.enemyName$field);
         }
         if(this.hasEnemyFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.enemyFaceId$field);
         }
         if(this.hasEnemyLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.enemyLevel$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.win$field);
         }
         if(this.hasAttack)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_BOOL(param1,this.attack$field);
         }
         if(this.hasEnemyQQFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_STRING(param1,this.enemyQQFaceURL$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc12_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc12_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.reportUid cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportUid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.enemyRoleId cannot be set twice.");
                  }
                  _loc4_++;
                  this.enemyRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.enemyName cannot be set twice.");
                  }
                  _loc5_++;
                  this.enemyName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.enemyFaceId cannot be set twice.");
                  }
                  _loc6_++;
                  this.enemyFaceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.enemyLevel cannot be set twice.");
                  }
                  _loc7_++;
                  this.enemyLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.score cannot be set twice.");
                  }
                  _loc8_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.win cannot be set twice.");
                  }
                  _loc9_++;
                  this.win = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.attack cannot be set twice.");
                  }
                  _loc10_++;
                  this.attack = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaRecorder.enemyQQFaceURL cannot be set twice.");
                  }
                  _loc11_++;
                  this.enemyQQFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
