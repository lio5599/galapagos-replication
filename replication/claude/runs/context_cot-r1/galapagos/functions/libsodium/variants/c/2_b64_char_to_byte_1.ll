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
  %shr = lshr i32 %sub, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 91
  %shr2 = lshr i32 %sub1, 8
  %and = and i32 %shr, %shr2
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 65
  %and4 = and i32 %and, %sub3
  %and5 = and i32 %and4, 255
  %4 = load i32, ptr %u, align 4
  %sub6 = sub i32 96, %4
  %shr7 = lshr i32 %sub6, 8
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 %5, 123
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %shr7, %shr9
  %6 = load i32, ptr %u, align 4
  %sub11 = sub i32 %6, 71
  %and12 = and i32 %and10, %sub11
  %and13 = and i32 %and12, 255
  %or = or i32 %and5, %and13
  %7 = load i32, ptr %u, align 4
  %sub14 = sub i32 47, %7
  %shr15 = lshr i32 %sub14, 8
  %8 = load i32, ptr %u, align 4
  %sub16 = sub i32 %8, 58
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr15, %shr17
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and19 = and i32 %and18, %add
  %and20 = and i32 %and19, 255
  %or21 = or i32 %or, %and20
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub22 = sub i32 %xor, 1
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 62
  %or25 = or i32 %or21, %and24
  %11 = load i32, ptr %u, align 4
  %xor26 = xor i32 %11, 47
  %sub27 = sub i32 %xor26, 1
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 %shr28, 63
  %or30 = or i32 %or25, %and29
  store i32 %or30, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %13 = load i32, ptr %x, align 4
  %sub31 = sub i32 %13, 1
  %shr32 = lshr i32 %sub31, 8
  %14 = load i32, ptr %u, align 4
  %xor33 = xor i32 %14, 65
  %sub34 = sub i32 0, %xor33
  %shr35 = lshr i32 %sub34, 8
  %and36 = and i32 %shr32, %shr35
  %and37 = and i32 %and36, 255
  %or38 = or i32 %12, %and37
  ret i32 %or38
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
