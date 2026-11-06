; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
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
  %a0 = alloca i32, align 4
  %a1 = alloca i32, align 4
  %l0 = alloca i32, align 4
  %l1 = alloca i32, align 4
  %d0 = alloca i32, align 4
  %d1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %a0, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  store i32 %sub1, ptr %a1, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  store i32 %sub2, ptr %l0, align 4
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  store i32 %sub3, ptr %l1, align 4
  %5 = load i32, ptr %u, align 4
  %sub4 = sub i32 %5, 48
  store i32 %sub4, ptr %d0, align 4
  %6 = load i32, ptr %u, align 4
  %sub5 = sub i32 57, %6
  store i32 %sub5, ptr %d1, align 4
  %7 = load i32, ptr %a0, align 4
  %not = xor i32 %7, -1
  %8 = load i32, ptr %a1, align 4
  %not6 = xor i32 %8, -1
  %and = and i32 %not, %not6
  %shr = lshr i32 %and, 8
  %9 = load i32, ptr %a0, align 4
  %and7 = and i32 %shr, %9
  %and8 = and i32 %and7, 255
  %10 = load i32, ptr %l0, align 4
  %not9 = xor i32 %10, -1
  %11 = load i32, ptr %l1, align 4
  %not10 = xor i32 %11, -1
  %and11 = and i32 %not9, %not10
  %shr12 = lshr i32 %and11, 8
  %12 = load i32, ptr %u, align 4
  %sub13 = sub i32 %12, 71
  %and14 = and i32 %shr12, %sub13
  %and15 = and i32 %and14, 255
  %or = or i32 %and8, %and15
  %13 = load i32, ptr %d0, align 4
  %not16 = xor i32 %13, -1
  %14 = load i32, ptr %d1, align 4
  %not17 = xor i32 %14, -1
  %and18 = and i32 %not16, %not17
  %shr19 = lshr i32 %and18, 8
  %15 = load i32, ptr %u, align 4
  %add = add i32 %15, 4
  %and20 = and i32 %shr19, %add
  %and21 = and i32 %and20, 255
  %or22 = or i32 %or, %and21
  %16 = load i32, ptr %u, align 4
  %xor = xor i32 %16, 43
  %sub23 = sub i32 %xor, 1
  %shr24 = lshr i32 %sub23, 8
  %and25 = and i32 %shr24, 62
  %or26 = or i32 %or22, %and25
  %17 = load i32, ptr %u, align 4
  %xor27 = xor i32 %17, 47
  %sub28 = sub i32 %xor27, 1
  %shr29 = lshr i32 %sub28, 8
  %and30 = and i32 %shr29, 63
  %or31 = or i32 %or26, %and30
  store i32 %or31, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %19 = load i32, ptr %x, align 4
  %sub32 = sub i32 %19, 1
  %shr33 = lshr i32 %sub32, 8
  %20 = load i32, ptr %u, align 4
  %xor34 = xor i32 %20, 65
  %sub35 = sub i32 0, %xor34
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %shr33, %shr36
  %and38 = and i32 %and37, 255
  %or39 = or i32 %18, %and38
  ret i32 %or39
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
