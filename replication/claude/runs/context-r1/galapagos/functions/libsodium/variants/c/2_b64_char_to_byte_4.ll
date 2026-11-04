; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
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
  %and = and i32 %sub, 65280
  %xor = xor i32 %and, 65280
  %shr = lshr i32 %xor, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %and2 = and i32 %sub1, 65280
  %xor3 = xor i32 %and2, 65280
  %shr4 = lshr i32 %xor3, 8
  %and5 = and i32 %shr, %shr4
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 65
  %and7 = and i32 %and5, %sub6
  %4 = load i32, ptr %u, align 4
  %sub8 = sub i32 %4, 97
  %and9 = and i32 %sub8, 65280
  %xor10 = xor i32 %and9, 65280
  %shr11 = lshr i32 %xor10, 8
  %5 = load i32, ptr %u, align 4
  %sub12 = sub i32 122, %5
  %and13 = and i32 %sub12, 65280
  %xor14 = xor i32 %and13, 65280
  %shr15 = lshr i32 %xor14, 8
  %and16 = and i32 %shr11, %shr15
  %6 = load i32, ptr %u, align 4
  %sub17 = sub i32 %6, 71
  %and18 = and i32 %and16, %sub17
  %or = or i32 %and7, %and18
  %7 = load i32, ptr %u, align 4
  %sub19 = sub i32 %7, 48
  %and20 = and i32 %sub19, 65280
  %xor21 = xor i32 %and20, 65280
  %shr22 = lshr i32 %xor21, 8
  %8 = load i32, ptr %u, align 4
  %sub23 = sub i32 57, %8
  %and24 = and i32 %sub23, 65280
  %xor25 = xor i32 %and24, 65280
  %shr26 = lshr i32 %xor25, 8
  %and27 = and i32 %shr22, %shr26
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and28 = and i32 %and27, %add
  %or29 = or i32 %or, %and28
  %10 = load i32, ptr %u, align 4
  %xor30 = xor i32 %10, 43
  %sub31 = sub i32 0, %xor30
  %and32 = and i32 %sub31, 65280
  %xor33 = xor i32 %and32, 65280
  %shr34 = lshr i32 %xor33, 8
  %and35 = and i32 %shr34, 62
  %or36 = or i32 %or29, %and35
  %11 = load i32, ptr %u, align 4
  %xor37 = xor i32 %11, 47
  %sub38 = sub i32 0, %xor37
  %and39 = and i32 %sub38, 65280
  %xor40 = xor i32 %and39, 65280
  %shr41 = lshr i32 %xor40, 8
  %and42 = and i32 %shr41, 63
  %or43 = or i32 %or36, %and42
  store i32 %or43, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %13 = load i32, ptr %x, align 4
  %sub44 = sub i32 0, %13
  %and45 = and i32 %sub44, 65280
  %xor46 = xor i32 %and45, 65280
  %shr47 = lshr i32 %xor46, 8
  %14 = load i32, ptr %u, align 4
  %xor48 = xor i32 %14, 65
  %sub49 = sub i32 0, %xor48
  %and50 = and i32 %sub49, 65280
  %shr51 = lshr i32 %and50, 8
  %and52 = and i32 %shr47, %shr51
  %or53 = or i32 %12, %and52
  ret i32 %or53
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
