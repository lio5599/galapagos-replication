; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_1.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %and = and i32 %sub, 65280
  %shr = lshr i32 %and, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %and2 = and i32 %sub1, 65280
  %shr3 = lshr i32 %and2, 8
  store i32 %shr3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %and5 = and i32 %sub4, 65280
  %shr6 = lshr i32 %and5, 8
  store i32 %shr6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %and8 = and i32 %sub7, 65280
  %shr9 = lshr i32 %and8, 8
  %xor10 = xor i32 %shr9, 255
  store i32 %xor10, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %and13 = and i32 %sub12, 65280
  %shr14 = lshr i32 %and13, 8
  %xor15 = xor i32 %shr14, 255
  store i32 %xor15, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and16 = and i32 %5, %add
  %7 = load i32, ptr %a, align 4
  %xor17 = xor i32 %7, 255
  %8 = load i32, ptr %b, align 4
  %and18 = and i32 %xor17, %8
  %9 = load i32, ptr %x.addr, align 4
  %add19 = add i32 %9, 71
  %and20 = and i32 %and18, %add19
  %or = or i32 %and16, %and20
  %10 = load i32, ptr %b, align 4
  %xor21 = xor i32 %10, 255
  %11 = load i32, ptr %c, align 4
  %and22 = and i32 %xor21, %11
  %12 = load i32, ptr %x.addr, align 4
  %sub23 = sub i32 %12, 4
  %and24 = and i32 %and22, %sub23
  %or25 = or i32 %or, %and24
  %13 = load i32, ptr %d, align 4
  %and26 = and i32 %13, 43
  %or27 = or i32 %or25, %and26
  %14 = load i32, ptr %e, align 4
  %and28 = and i32 %14, 47
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
