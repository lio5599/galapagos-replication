; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %y = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %y, align 4
  %1 = load i32, ptr %y, align 4
  %sub = sub i32 %1, 26
  %and1 = and i32 %sub, 65280
  %shr = lshr i32 %and1, 8
  store i32 %shr, ptr %a, align 4
  %2 = load i32, ptr %y, align 4
  %sub2 = sub i32 %2, 52
  %and3 = and i32 %sub2, 65280
  %shr4 = lshr i32 %and3, 8
  store i32 %shr4, ptr %b, align 4
  %3 = load i32, ptr %y, align 4
  %sub5 = sub i32 %3, 62
  %and6 = and i32 %sub5, 65280
  %shr7 = lshr i32 %and6, 8
  store i32 %shr7, ptr %c, align 4
  %4 = load i32, ptr %y, align 4
  %xor = xor i32 %4, 62
  %sub8 = sub i32 0, %xor
  %not = xor i32 %sub8, -1
  %and9 = and i32 %not, 65280
  %shr10 = lshr i32 %and9, 8
  store i32 %shr10, ptr %d, align 4
  %5 = load i32, ptr %y, align 4
  %xor11 = xor i32 %5, 63
  %sub12 = sub i32 0, %xor11
  %not13 = xor i32 %sub12, -1
  %and14 = and i32 %not13, 65280
  %shr15 = lshr i32 %and14, 8
  store i32 %shr15, ptr %e, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %y, align 4
  %add = add i32 %7, 65
  %and16 = and i32 %6, %add
  %8 = load i32, ptr %a, align 4
  %xor17 = xor i32 255, %8
  %9 = load i32, ptr %b, align 4
  %and18 = and i32 %xor17, %9
  %10 = load i32, ptr %y, align 4
  %add19 = add i32 %10, 71
  %and20 = and i32 %and18, %add19
  %or = or i32 %and16, %and20
  %11 = load i32, ptr %b, align 4
  %xor21 = xor i32 255, %11
  %12 = load i32, ptr %c, align 4
  %and22 = and i32 %xor21, %12
  %13 = load i32, ptr %y, align 4
  %add23 = add i32 %13, -4
  %and24 = and i32 %and22, %add23
  %or25 = or i32 %or, %and24
  %14 = load i32, ptr %d, align 4
  %and26 = and i32 %14, 43
  %or27 = or i32 %or25, %and26
  %15 = load i32, ptr %e, align 4
  %and28 = and i32 %15, 47
  %or29 = or i32 %or27, %and28
  ret i32 %or29
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
