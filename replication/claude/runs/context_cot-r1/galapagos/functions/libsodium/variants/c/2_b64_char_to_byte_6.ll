; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %not = xor i32 %sub, -1
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %not2 = xor i32 %sub1, -1
  %and = and i32 %not, %not2
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 65
  %shl = shl i32 %sub3, 8
  %and4 = and i32 %and, %shl
  %shr = lshr i32 %and4, 8
  %and5 = and i32 %shr, 255
  %4 = load i32, ptr %u, align 4
  %sub6 = sub i32 %4, 97
  %not7 = xor i32 %sub6, -1
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 122, %5
  %not9 = xor i32 %sub8, -1
  %and10 = and i32 %not7, %not9
  %6 = load i32, ptr %u, align 4
  %sub11 = sub i32 %6, 71
  %shl12 = shl i32 %sub11, 8
  %and13 = and i32 %and10, %shl12
  %shr14 = lshr i32 %and13, 8
  %and15 = and i32 %shr14, 255
  %or = or i32 %and5, %and15
  %7 = load i32, ptr %u, align 4
  %sub16 = sub i32 %7, 48
  %not17 = xor i32 %sub16, -1
  %8 = load i32, ptr %u, align 4
  %sub18 = sub i32 57, %8
  %not19 = xor i32 %sub18, -1
  %and20 = and i32 %not17, %not19
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %shl21 = shl i32 %add, 8
  %and22 = and i32 %and20, %shl21
  %shr23 = lshr i32 %and22, 8
  %and24 = and i32 %shr23, 255
  %or25 = or i32 %or, %and24
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub26 = sub i32 0, %xor
  %not27 = xor i32 %sub26, -1
  %and28 = and i32 %not27, 15872
  %shr29 = lshr i32 %and28, 8
  %and30 = and i32 %shr29, 255
  %or31 = or i32 %or25, %and30
  %11 = load i32, ptr %u, align 4
  %xor32 = xor i32 %11, 47
  %sub33 = sub i32 0, %xor32
  %not34 = xor i32 %sub33, -1
  %and35 = and i32 %not34, 16128
  %shr36 = lshr i32 %and35, 8
  %and37 = and i32 %shr36, 255
  %or38 = or i32 %or31, %and37
  store i32 %or38, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %13 = load i32, ptr %x, align 4
  %sub39 = sub i32 0, %13
  %not40 = xor i32 %sub39, -1
  %14 = load i32, ptr %u, align 4
  %xor41 = xor i32 %14, 65
  %sub42 = sub i32 0, %xor41
  %and43 = and i32 %not40, %sub42
  %shr44 = lshr i32 %and43, 8
  %and45 = and i32 %shr44, 255
  %or46 = or i32 %12, %and45
  ret i32 %or46
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
