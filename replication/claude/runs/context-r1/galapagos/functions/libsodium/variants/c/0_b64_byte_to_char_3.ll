; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_3.c"
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
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %e62 = alloca i32, align 4
  %e63 = alloca i32, align 4
  %lower = alloca i32, align 4
  %letters = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %not = xor i32 %0, -1
  %add = add i32 %not, 26
  %not1 = xor i32 %add, -1
  %shr = lshr i32 %not1, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %m26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %not2 = xor i32 %1, -1
  %add3 = add i32 %not2, 52
  %not4 = xor i32 %add3, -1
  %shr5 = lshr i32 %not4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %m52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %not7 = xor i32 %2, -1
  %add8 = add i32 %not7, 62
  %not9 = xor i32 %add8, -1
  %shr10 = lshr i32 %not9, 8
  %and11 = and i32 %shr10, 255
  store i32 %and11, ptr %m62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub = sub i32 0, %xor
  %shr12 = lshr i32 %sub, 8
  %xor13 = xor i32 %shr12, 255
  store i32 %xor13, ptr %e62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor14 = xor i32 %4, 63
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %xor17 = xor i32 %shr16, 255
  store i32 %xor17, ptr %e63, align 4
  %5 = load i32, ptr %m52, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add18 = add i32 %6, 71
  %and19 = and i32 %5, %add18
  store i32 %and19, ptr %lower, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add20 = add i32 %7, 65
  %8 = load i32, ptr %lower, align 4
  %xor21 = xor i32 %add20, %8
  %9 = load i32, ptr %m26, align 4
  %and22 = and i32 %xor21, %9
  %10 = load i32, ptr %lower, align 4
  %xor23 = xor i32 %and22, %10
  store i32 %xor23, ptr %letters, align 4
  %11 = load i32, ptr %letters, align 4
  %12 = load i32, ptr %m52, align 4
  %not24 = xor i32 %12, -1
  %13 = load i32, ptr %m62, align 4
  %and25 = and i32 %not24, %13
  %14 = load i32, ptr %x.addr, align 4
  %sub26 = sub i32 %14, 4
  %and27 = and i32 %and25, %sub26
  %or = or i32 %11, %and27
  %15 = load i32, ptr %e62, align 4
  %and28 = and i32 %15, 43
  %or29 = or i32 %or, %and28
  %16 = load i32, ptr %e63, align 4
  %and30 = and i32 %16, 47
  %or31 = or i32 %or29, %and30
  ret i32 %or31
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
