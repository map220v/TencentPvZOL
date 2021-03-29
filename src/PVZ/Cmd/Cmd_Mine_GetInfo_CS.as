package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mine_GetInfo_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mine_GetInfo_CS";
      
      public static const MINEPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Mine_GetInfo_CS.minePos","minePos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
       
      
      private var minePos$field:Dto_WorldMap_Pos;
      
      public function Cmd_Mine_GetInfo_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mine_GetInfo_CS.$MessageID;
      }
      
      public function clearMinePos() : void
      {
         this.minePos$field = null;
      }
      
      public function get hasMinePos() : Boolean
      {
         return this.minePos$field != null;
      }
      
      public function set minePos(param1:Dto_WorldMap_Pos) : void
      {
         this.minePos$field = param1;
      }
      
      public function get minePos() : Dto_WorldMap_Pos
      {
         return this.minePos$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMinePos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.minePos$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetInfo_CS.minePos cannot be set twice.");
                  }
                  _loc3_++;
                  this.minePos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.minePos);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}