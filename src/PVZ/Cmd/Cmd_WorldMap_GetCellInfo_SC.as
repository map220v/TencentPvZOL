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
   
   public final class Cmd_WorldMap_GetCellInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_WorldMap_GetCellInfo_SC";
      
      public static const CELLINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_GetCellInfo_SC.cellInfo","cellInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_CellInfo);
       
      
      private var cellInfo$field:Dto_WorldMap_CellInfo;
      
      public function Cmd_WorldMap_GetCellInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_WorldMap_GetCellInfo_SC.$MessageID;
      }
      
      public function clearCellInfo() : void
      {
         this.cellInfo$field = null;
      }
      
      public function get hasCellInfo() : Boolean
      {
         return this.cellInfo$field != null;
      }
      
      public function set cellInfo(param1:Dto_WorldMap_CellInfo) : void
      {
         this.cellInfo$field = param1;
      }
      
      public function get cellInfo() : Dto_WorldMap_CellInfo
      {
         return this.cellInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCellInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cellInfo$field);
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
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCellInfo_SC.cellInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.cellInfo = new Dto_WorldMap_CellInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.cellInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
