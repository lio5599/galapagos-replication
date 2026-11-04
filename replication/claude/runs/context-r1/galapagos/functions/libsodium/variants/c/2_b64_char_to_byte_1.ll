; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %sub = sub i32 64, %1
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 91
  %and = and i32 %sub, %sub1
  %shr = lshr i32 %and, 8
  %and2 = and i32 %shr, 255
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 65
  %and4 = and i32 %and2, %sub3
  %4 = load i32, ptr %u, align 4
  %sub5 = sub i32 96, %4
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 %5, 123
  %and7 = and i32 %sub5, %sub6
  %shr8 = lshr i32 %and7, 8
  %and9 = and i32 %shr8, 255
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 %6, 71
  %and11 = and i32 %and9, %sub10
  %or = or i32 %and4, %and11
  %7 = load i32, ptr %u, align 4
  %sub12 = sub i32 47, %7
  %8 = load i32, ptr %u, align 4
  %sub13 = sub i32 %8, 58
  %and14 = and i32 %sub12, %sub13
  %shr15 = lshr i32 %and14, 8
  %and16 = and i32 %shr15, 255
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and17 = and i32 %and16, %add
  %or18 = or i32 %or, %and17
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub19 = sub i32 %xor, 1
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 62
  %or22 = or i32 %or18, %and21
  %11 = load i32, ptr %u, align 4
  %xor23 = xor i32 %11, 47
  %sub24 = sub i32 %xor23, 1
  %shr25 = lshr i32 %sub24, 8
  %and26 = and i32 %shr25, 63
  %or27 = or i32 %or22, %and26
  store i32 %or27, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %13 = load i32, ptr %x, align 4
  %sub28 = sub i32 %13, 1
  %shr29 = lshr i32 %sub28, 8
  %14 = load i32, ptr %u, align 4
  %xor30 = xor i32 %14, 65
  %sub31 = sub i32 0, %xor30
  %shr32 = lshr i32 %sub31, 8
  %and33 = and i32 %shr29, %shr32
  %and34 = and i32 %and33, 255
  %or35 = or i32 %12, %and34
  ret i32 %or35
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
