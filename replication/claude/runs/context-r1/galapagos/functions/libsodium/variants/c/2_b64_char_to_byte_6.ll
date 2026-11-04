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
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %not = xor i32 %or, -1
  %and = and i32 %not, 65280
  %shr = lshr i32 %and, 8
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and3 = and i32 %shr, %sub2
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %5
  %or6 = or i32 %sub4, %sub5
  %not7 = xor i32 %or6, -1
  %and8 = and i32 %not7, 65280
  %shr9 = lshr i32 %and8, 8
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 %6, 71
  %and11 = and i32 %shr9, %sub10
  %or12 = or i32 %and3, %and11
  %7 = load i32, ptr %u, align 4
  %sub13 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub14 = sub i32 57, %8
  %or15 = or i32 %sub13, %sub14
  %not16 = xor i32 %or15, -1
  %and17 = and i32 %not16, 65280
  %shr18 = lshr i32 %and17, 8
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and19 = and i32 %shr18, %add
  %or20 = or i32 %or12, %and19
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub21 = sub i32 0, %xor
  %not22 = xor i32 %sub21, -1
  %and23 = and i32 %not22, 15872
  %shr24 = lshr i32 %and23, 8
  %or25 = or i32 %or20, %shr24
  %11 = load i32, ptr %u, align 4
  %xor26 = xor i32 %11, 47
  %sub27 = sub i32 0, %xor26
  %not28 = xor i32 %sub27, -1
  %and29 = and i32 %not28, 16128
  %shr30 = lshr i32 %and29, 8
  %or31 = or i32 %or25, %shr30
  store i32 %or31, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %13 = load i32, ptr %x, align 4
  %sub32 = sub i32 %13, 1
  %14 = load i32, ptr %u, align 4
  %xor33 = xor i32 %14, 65
  %sub34 = sub i32 0, %xor33
  %and35 = and i32 %sub32, %sub34
  %and36 = and i32 %and35, 65280
  %shr37 = lshr i32 %and36, 8
  %or38 = or i32 %12, %shr37
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
