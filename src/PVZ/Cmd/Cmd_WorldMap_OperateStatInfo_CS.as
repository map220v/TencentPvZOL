package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_WorldMap_OperateStatInfo_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS";
      
      public static const LEFTTOP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS.leftTop","leftTop",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const RIGHTTOP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS.rightTop","rightTop",2 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const LEFTBOTTOM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS.leftBottom","leftBottom",3 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const RIGHTBOTTOM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS.rightBottom","rightBottom",4 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const OPERATETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS.operateTimes","operateTimes",5 << 3 | WireType.VARINT);
      
      public static const RESOLUTIONX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS.resolutionX","resolutionX",6 << 3 | WireType.VARINT);
      
      public static const RESOLUTIONY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS.resolutionY","resolutionY",7 << 3 | WireType.VARINT);
       
      
      private var leftTop$field:Dto_WorldMap_Pos;
      
      private var rightTop$field:Dto_WorldMap_Pos;
      
      private var leftBottom$field:Dto_WorldMap_Pos;
      
      private var rightBottom$field:Dto_WorldMap_Pos;
      
      private var operateTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var resolutionX$field:uint;
      
      private var resolutionY$field:uint;
      
      public function Cmd_WorldMap_OperateStatInfo_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_WorldMap_OperateStatInfo_CS.$MessageID;
      }
      
      public function clearLeftTop() : void
      {
         this.leftTop$field = null;
      }
      
      public function get hasLeftTop() : Boolean
      {
         return this.leftTop$field != null;
      }
      
      public function set leftTop(param1:Dto_WorldMap_Pos) : void
      {
         this.leftTop$field = param1;
      }
      
      public function get leftTop() : Dto_WorldMap_Pos
      {
         return this.leftTop$field;
      }
      
      public function clearRightTop() : void
      {
         this.rightTop$field = null;
      }
      
      public function get hasRightTop() : Boolean
      {
         return this.rightTop$field != null;
      }
      
      public function set rightTop(param1:Dto_WorldMap_Pos) : void
      {
         this.rightTop$field = param1;
      }
      
      public function get rightTop() : Dto_WorldMap_Pos
      {
         return this.rightTop$field;
      }
      
      public function clearLeftBottom() : void
      {
         this.leftBottom$field = null;
      }
      
      public function get hasLeftBottom() : Boolean
      {
         return this.leftBottom$field != null;
      }
      
      public function set leftBottom(param1:Dto_WorldMap_Pos) : void
      {
         this.leftBottom$field = param1;
      }
      
      public function get leftBottom() : Dto_WorldMap_Pos
      {
         return this.leftBottom$field;
      }
      
      public function clearRightBottom() : void
      {
         this.rightBottom$field = null;
      }
      
      public function get hasRightBottom() : Boolean
      {
         return this.rightBottom$field != null;
      }
      
      public function set rightBottom(param1:Dto_WorldMap_Pos) : void
      {
         this.rightBottom$field = param1;
      }
      
      public function get rightBottom() : Dto_WorldMap_Pos
      {
         return this.rightBottom$field;
      }
      
      public function clearOperateTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.operateTimes$field = new uint();
      }
      
      public function get hasOperateTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set operateTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.operateTimes$field = param1;
      }
      
      public function get operateTimes() : uint
      {
         return this.operateTimes$field;
      }
      
      public function clearResolutionX() : void
      {
         this.hasField$0 &= 4294967293;
         this.resolutionX$field = new uint();
      }
      
      public function get hasResolutionX() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set resolutionX(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.resolutionX$field = param1;
      }
      
      public function get resolutionX() : uint
      {
         return this.resolutionX$field;
      }
      
      public function clearResolutionY() : void
      {
         this.hasField$0 &= 4294967291;
         this.resolutionY$field = new uint();
      }
      
      public function get hasResolutionY() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set resolutionY(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.resolutionY$field = param1;
      }
      
      public function get resolutionY() : uint
      {
         return this.resolutionY$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLeftTop)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftTop$field);
         }
         if(this.hasRightTop)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rightTop$field);
         }
         if(this.hasLeftBottom)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftBottom$field);
         }
         if(this.hasRightBottom)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rightBottom$field);
         }
         if(this.hasOperateTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.operateTimes$field);
         }
         if(this.hasResolutionX)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.resolutionX$field);
         }
         if(this.hasResolutionY)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.resolutionY$field);
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
                     throw new IOError("Bad data format: Cmd_WorldMap_OperateStatInfo_CS.leftTop cannot be set twice.");
                  }
                  _loc3_++;
                  this.leftTop = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leftTop);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_OperateStatInfo_CS.rightTop cannot be set twice.");
                  }
                  _loc4_++;
                  this.rightTop = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rightTop);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_OperateStatInfo_CS.leftBottom cannot be set twice.");
                  }
                  _loc5_++;
                  this.leftBottom = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leftBottom);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_OperateStatInfo_CS.rightBottom cannot be set twice.");
                  }
                  _loc6_++;
                  this.rightBottom = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rightBottom);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_OperateStatInfo_CS.operateTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.operateTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_OperateStatInfo_CS.resolutionX cannot be set twice.");
                  }
                  _loc8_++;
                  this.resolutionX = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_OperateStatInfo_CS.resolutionY cannot be set twice.");
                  }
                  _loc9_++;
                  this.resolutionY = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
