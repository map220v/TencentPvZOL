package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_WorldMap_Pos extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_WorldMap_Pos";
      
      public static const POSX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_WorldMap_Pos.posX","posX",1 << 3 | WireType.VARINT);
      
      public static const POSY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_WorldMap_Pos.posY","posY",2 << 3 | WireType.VARINT);
       
      
      private var posX$field:int;
      
      private var hasField$0:uint = 0;
      
      private var posY$field:int;
      
      public function Dto_WorldMap_Pos()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_WorldMap_Pos.$MessageID;
      }
      
      public function clearPosX() : void
      {
         this.hasField$0 &= 4294967294;
         this.posX$field = new int();
      }
      
      public function get hasPosX() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set posX(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.posX$field = param1;
      }
      
      public function get posX() : int
      {
         return this.posX$field;
      }
      
      public function clearPosY() : void
      {
         this.hasField$0 &= 4294967293;
         this.posY$field = new int();
      }
      
      public function get hasPosY() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set posY(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.posY$field = param1;
      }
      
      public function get posY() : int
      {
         return this.posY$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPosX)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT32(param1,this.posX$field);
         }
         if(this.hasPosY)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT32(param1,this.posY$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_WorldMap_Pos.posX cannot be set twice.");
                  }
                  _loc3_++;
                  this.posX = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_Pos.posY cannot be set twice.");
                  }
                  _loc4_++;
                  this.posY = ReadUtils.read$TYPE_INT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
