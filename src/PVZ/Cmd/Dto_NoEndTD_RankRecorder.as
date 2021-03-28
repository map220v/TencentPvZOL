package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_NoEndTD_RankRecorder extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_NoEndTD_RankRecorder";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_NoEndTD_RankRecorder.RoleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_RankRecorder.Score","score",2 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_NoEndTD_RankRecorder.QQFaceUrl","qQFaceUrl",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const UP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_RankRecorder.Up","up",4 << 3 | WireType.VARINT);
      
      public static const DOWN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_RankRecorder.Down","down",5 << 3 | WireType.VARINT);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_RankRecorder.FaceId","faceId",6 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_NoEndTD_RankRecorder.Name","name",7 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var RoleId$field:Int64;
      
      private var Score$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var QQFaceUrl$field:String;
      
      private var Up$field:uint;
      
      private var Down$field:uint;
      
      private var FaceId$field:uint;
      
      private var Name$field:String;
      
      public function Dto_NoEndTD_RankRecorder()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_NoEndTD_RankRecorder.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.RoleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.RoleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.RoleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.RoleId$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967294;
         this.Score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.Score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.Score$field;
      }
      
      public function clearQQFaceUrl() : void
      {
         this.QQFaceUrl$field = null;
      }
      
      public function get hasQQFaceUrl() : Boolean
      {
         return this.QQFaceUrl$field != null;
      }
      
      public function set qQFaceUrl(param1:String) : void
      {
         this.QQFaceUrl$field = param1;
      }
      
      public function get qQFaceUrl() : String
      {
         return this.QQFaceUrl$field;
      }
      
      public function clearUp() : void
      {
         this.hasField$0 &= 4294967293;
         this.Up$field = new uint();
      }
      
      public function get hasUp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set up(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.Up$field = param1;
      }
      
      public function get up() : uint
      {
         return this.Up$field;
      }
      
      public function clearDown() : void
      {
         this.hasField$0 &= 4294967291;
         this.Down$field = new uint();
      }
      
      public function get hasDown() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set down(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.Down$field = param1;
      }
      
      public function get down() : uint
      {
         return this.Down$field;
      }
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967287;
         this.FaceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.FaceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.FaceId$field;
      }
      
      public function clearName() : void
      {
         this.Name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.Name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.Name$field = param1;
      }
      
      public function get name() : String
      {
         return this.Name$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.RoleId$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.Score$field);
         }
         if(this.hasQQFaceUrl)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.QQFaceUrl$field);
         }
         if(this.hasUp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.Up$field);
         }
         if(this.hasDown)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.Down$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.FaceId$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.Name$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_RankRecorder.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_RankRecorder.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_RankRecorder.qQFaceUrl cannot be set twice.");
                  }
                  _loc5_++;
                  this.qQFaceUrl = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_RankRecorder.up cannot be set twice.");
                  }
                  _loc6_++;
                  this.up = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_RankRecorder.down cannot be set twice.");
                  }
                  _loc7_++;
                  this.down = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_RankRecorder.faceId cannot be set twice.");
                  }
                  _loc8_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_RankRecorder.name cannot be set twice.");
                  }
                  _loc9_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
